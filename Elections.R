.libPaths('C:/R-Lib')

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

ky <- readOGR(dsn = '.', layer = 'KY Precincts Merged Final')

gpclibPermit()

ky@data$id <- rownames(ky@data)
ky.points <- fortify(ky, region='id')
ky.df <- inner_join(ky.points, ky@data, by='id')
ky.df <- subset(ky.df, long<181)
jeffco<-subset(ky.df, COUNTY==21111)
ggplot(jeffco) + aes(long,lat, group=group) + geom_polygon()


primary<-fromJSON(file='./PrimaryElection16.json')
Contests<-primary$Contest
Metro8<-Contests[[21]]
Metro8<-data.frame(matrix(unlist(Metro8$V), nrow=length(Metro8$V), byrow=T),  precinct=Metro8$P)
colnames(Metro8)<-c('Kolb','Wooden','Long','Meyer','Reily','Coan','White','region')

Metro8Percent<-Metro8
for(i in 1:length(Metro8Percent$region)){
  Metro8Percent$Kolb[i]<-Metro8$Kolb[i]/rowSums(Metro8[1:7])[i]
  Metro8Percent$Wooden[i]<-Metro8$Wooden[i]/rowSums(Metro8[1:7])[i]
  Metro8Percent$Long[i]<-Metro8$Long[i]/rowSums(Metro8[1:7])[i]
  Metro8Percent$Meyer[i]<-Metro8$Meyer[i]/rowSums(Metro8[1:7])[i]
  Metro8Percent$Reily[i]<-Metro8$Reily[i]/rowSums(Metro8[1:7])[i]
  Metro8Percent$Coan[i]<-Metro8$Coan[i]/rowSums(Metro8[1:7])[i]
  Metro8Percent$White[i]<-Metro8$White[i]/rowSums(Metro8[1:7])[i]
}

Eight.df<-subset(jeffco, VTDID %in% Metro8Percent$region)
Eight.df$region<-Eight.df$VTDID

Metro8Choropleth <- R6Class("Metro8Choropleth", inherit = choroplethr::Choropleth, public = list(
  initialize=function(user.df){
    super$initialize(Eight.df, user.df)
  }
))

white<-subset(Metro8Percent, select = c('region','White'))
colnames(white) <- c('region','value')
WhiteChoro <- Metro8Choropleth$new(white)
WhiteChoro$title <- 'White Vote Percent By Precinct'
WhiteChoro$set_num_colors(1)
WhiteChoro$legend <- 'Percent of Vote'
WhiteChoro$render_with_reference_map()


coan<-subset(Metro8Percent, select = c('region','Coan'))
colnames(coan) <- c('region','value')
coanChoro <- Metro8Choropleth$new(coan)
coanChoro$title <- 'Coan Vote Percent By Precinct'
coanChoro$set_num_colors(1)
coanChoro$legend <- 'Percent of Vote'
coanChoro$render_with_reference_map()

reily<-subset(Metro8Percent, select = c('region','Reily'))
colnames(reily) <- c('region','value')
reilyChoro <- Metro8Choropleth$new(reily)
reilyChoro$title <- 'Reily Vote Percent By Precinct'
reilyChoro$set_num_colors(1)
reilyChoro$legend <- 'Percent of Vote'
reilyChoro$render_with_reference_map()

meyer<-subset(Metro8Percent, select = c('region','Meyer'))
colnames(meyer) <- c('region','value')
meyerChoro <- Metro8Choropleth$new(meyer)
meyerChoro$title <- 'Meyer Vote Percent By Precinct'
meyerChoro$set_num_colors(1)
meyerChoro$legend <- 'Percent of Vote'
meyerChoro$render_with_reference_map()

long<-subset(Metro8Percent, select = c('region','Long'))
colnames(long) <- c('region','value')
longChoro <- Metro8Choropleth$new(long)
longChoro$title <- 'Long Vote Percent By Precinct'
longChoro$set_num_colors(1)
longChoro$legend <- 'Percent of Vote'
longChoro$render_with_reference_map()

kolb<-subset(Metro8Percent, select = c('region','Kolb'))
colnames(kolb) <- c('region','value')
kolbChoro <- Metro8Choropleth$new(kolb)
kolbChoro$title <- 'Kolb Vote Percent By Precinct'
kolbChoro$set_num_colors(1)
kolbChoro$legend <- 'Percent of Vote'
kolbChoro$render_with_reference_map()

wooden<-subset(Metro8Percent, select = c('region','Wooden'))
colnames(wooden) <- c('region','value')
woodenChoro <- Metro8Choropleth$new(wooden)
woodenChoro$title <- 'Wooden Vote Percent By Precinct'
woodenChoro$set_num_colors(1)
woodenChoro$legend <- 'Percent of Vote'
woodenChoro$render_with_reference_map()

grid.arrange(coanChoro$render_with_reference_map(),reilyChoro$render_with_reference_map(),
             kolbChoro$render_with_reference_map(),meyerChoro$render_with_reference_map(),
             longChoro$render_with_reference_map(), WhiteChoro$render_with_reference_map(),
             woodenChoro$render_with_reference_map(),
             ncol=2 )
