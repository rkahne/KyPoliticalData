library('rgdal')
library('gpclib')
library('maptools')
library('ggplot2')
library('dplyr')
library('mapproj')
library('choroplethrMaps')
library('gridExtra')
library('readr')
library('dplyr')
library('R6')
library('choroplethr')
library('rjson')
library('leaflet')
library('raster')
library('shiny')

options(stringsAsFactors = F)

Pres<-read.csv('./Pres1.csv')
Pres$region<-paste(Pres$county,Pres$precinct,sep='')


ky <- readOGR(dsn = '.', layer = 'KY Precincts Merged Final')

gpclibPermit()

ky@data$id <- rownames(ky@data)
ky.points <- fortify(ky, region='id')
ky.df <- inner_join(ky.points, ky@data, by='id')
ky.df <- subset(ky.df, long<181)
ky.df$region<-ky.df$vtd

Pres$region<-paste(Pres$county,Pres$precinct,sep='')

ky$clinton<-sapply(ky$vtd,function(i){
  Pres$CLINTON[which(Pres$region==i)[1]]
})

ky$sanders<-sapply(ky$vtd,function(i){
  Pres$SANDERS[which(Pres$region==i)[1]]
})

ky$omalley<-sapply(ky$vtd,function(i){
  Pres$OMALLEY[which(Pres$region==i)[1]]
})

ky$fuente<-sapply(ky$vtd,function(i){
  Pres$FUENTE[which(Pres$region==i)[1]]
})

ky$uncommitted<-sapply(ky$vtd,function(i){
  Pres$UNCOMMITTED[which(Pres$region==i)[1]]
})

ky$winner<-vector(length=length(ky$vtd))
for(i in 1:length(ky$winner)){
  if(length(colnames(ky@data[23:27])[which(max(ky@data[23:27][i,])==ky@data[23:27][i,])])==0){
    ky$winner[i]<-NA
  }else{
    ky$winner[i]<-colnames(ky@data[23:27])[which(max(ky@data[23:27][i,])==ky@data[23:27][i,])]
  }
}
ky$winner<-as.factor(ky$winner)

pal<-colorQuantile("Blues", NULL, n=7)
factpal<-colorFactor(c('#e41a1c','#377eb8','#4daf4a','#984ea3','#ff7f00'),levels(ky@data$winner))

pop<-paste0('<strong>',ky$vtdid,'</strong>',
            '<br>CLINTON: ',ky$clinton,
            '<br>SANDERS: ',ky$sanders,
            '<br>OMALLEY: ',ky$omalley,
            '<br>FUENTE: ',ky$fuente,
            '<br>UNCOMMITTED: ',ky$uncommitted)


map <- leaflet(data=ky) %>% 
  addTiles() %>%  
  setView(lng=-85.686176, lat=37.617984, zoom=7) %>% 
  addPolygons(stroke=F, 
              smoothFactor=0.2, 
              fillOpacity = 0.75, 
              color=~factpal(winner), 
              popup=pop) %>% 
  addPolylines(weight=1, color='black')


app<-shinyApp(
  ui<-bootstrapPage(
    tags$style(type='text/css','html, body {width:100%;height:100%}'),
    leafletOutput('theMap', width = '100%', height='100%')
  ),
  server<-function(input,output){
    output$theMap <- renderLeaflet(map)
  }
)

if(interactive()) print(app)





# 
# KYChoropleth <- R6Class("KYChoropleth", inherit = choroplethr::Choropleth, public = list(
#   initialize=function(user.df){
#     super$initialize(ky.df, user.df)
#   }
# ))
# 
# clinton<-subset(Pres, select = c('region','CLINTON'))
# colnames(clinton) <- c('region','value')
# clintonChoro <- KYChoropleth$new(clinton.1)
# clintonChoro$title <- 'Clinton Vote Percent By Precinct'
# clitonChoro$set_num_colors(1)
# clintonChoro$legend <- 'Percent of Vote'
# clintonChoro$render_with_reference_map()
# 
# map <- leaflet(data=Eight) %>% 
#   addTiles() %>%  
#   setView(lng=-85.694006, lat=38.224536, zoom=13) %>% 
#   addPolygons(stroke=F, 
#               smoothFactor=0.2, 
#               fillOpacity = 0.75, 
#               color=~factpal(winner), 
#               popup=pop) %>% 
#   addPolylines(weight=1, color='black')
