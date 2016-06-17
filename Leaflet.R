library('leaflet')
library('raster')
Louisville <- subset(ky, state_coun==21111)
Eight<-subset(ky, vtdid %in% Metro8Percent$region)
Pres<-read.csv('./Pres1.csv')

Eight$coan<-sapply(Eight$vtdid,function(i){
  Metro8$Coan[which(Metro8$region==i)]
})
Eight$reily<-sapply(Eight$vtdid,function(i){
  Metro8$Reily[which(Metro8$region==i)]
})
Eight$kolb<-sapply(Eight$vtdid,function(i){
  Metro8$Kolb[which(Metro8$region==i)]
})
Eight$meyer<-sapply(Eight$vtdid,function(i){
  Metro8$Meyer[which(Metro8$region==i)]
})
Eight$long<-sapply(Eight$vtdid,function(i){
  Metro8$Long[which(Metro8$region==i)]
})
Eight$white<-sapply(Eight$vtdid,function(i){
  Metro8$White[which(Metro8$region==i)]
})
Eight$wooden<-sapply(Eight$vtdid,function(i){
  Metro8$Wooden[which(Metro8$region==i)]
})
Eight$winner<-sapply(Eight$vtdid,function(i){
  Metro8$winner[which(Metro8$region==i)]
})
Eight$winner<-as.factor(Eight$winner)

pop<-paste0('<strong>',Eight$vtdid,'</strong>',
            '<br>COAN: ',Eight$coan,
            '<br>REILY: ',Eight$reily,
            '<br>KOLB: ',Eight$kolb,
            '<br>MEYER: ',Eight$meyer,
            '<br>LONG: ',Eight$long,
            '<br>WHITE: ',Eight$white,
            '<br>WOODEN: ',Eight$wooden)
pal<-colorQuantile("Blues", NULL, n=7)
factpal<-colorFactor(c('#e41a1c','#377eb8','#4daf4a','#984ea3','#ff7f00'),levels(Eight$winner))


map <- leaflet(data=Eight) %>% 
  addTiles() %>%  
  setView(lng=-85.694006, lat=38.224536, zoom=13) %>% 
  addPolygons(stroke=F, 
              smoothFactor=0.2, 
              fillOpacity = 0.75, 
              color=~factpal(winner), 
              popup=pop) %>% 
  addPolylines(weight=1, color='black') %>% 
  addLegend("topright", pal=pal,
            title="Winner By Precinct", values=~c('Coan','Reily','Kolb','Meyer','Long','White','Wooden'),
            opacity=1)

map <- leaflet(data=Eight) %>% 
  addTiles() %>%  
  setView(lng=-85.694006, lat=38.224536, zoom=13) %>% 
  addPolygons(stroke=F, 
              smoothFactor=0.2, 
              fillOpacity = 0.75, 
              color=~factpal(winner), 
              popup=pop) %>% 
  addPolylines(weight=1, color='black')



  













colnames(Pres)[2]<-'vtdid'

Pres$vtd<-vector(length=length(Pres$vtdid))
for(i in 1:length(Pres$vtd)){
  Pres$vtd[i]<-paste(Pres$county[i],Pres$vtdid[i],sep='')
}

ky.df$Clinton<-sapply(ky.df$vtd,function(i){
  Pres$CLINTON[which(Pres$vtd==i)[1]]
})
ky.df$Clinton<-as.numeric(ky.df$Clinton)
ky.df$Sanders<-sapply(ky.df$vtd,function(i){
  Pres$SANDERS[which(Pres$vtd==i)[1]]
})
ky.df$Sanders<-as.numeric(ky.df$Sanders)
ky.df$OMalley<-sapply(ky.df$vtd,function(i){
  Pres$OMALLEY[which(Pres$vtd==i)[1]]
 })
ky.df$OMalley<-as.numeric(ky.df$OMalley)
ky.df$Fuente<-sapply(ky.df$vtd,function(i){
  Pres$FUENTE[which(Pres$vtd==i)[1]]
})
ky.df$Fuente<-as.numeric(ky.df$Fuente)
ky.df$Uncomitted<-sapply(ky.df$vtd,function(i){
  Pres$UNCOMMITTED[which(Pres$vtd==i)[1]]
})
ky.df$Uncomitted<-as.numeric(ky.df$Uncomitted)


Pres$winner<-vector(length=length(Pres$county))
for(i in 1:length(Pres$winner)){
  Pres$winner[i]<-colnames(Pres[,3:7])[which(max(Pres[,3:7][i,])==Pres[,3:7][i,])]
}


ky.df$winner<-sapply(ky.df$vtd,function(i){
  Pres$winner[which(Pres$vtd==i)]
})

ky.df$winner<-as.factor(ky.df$winner)

ky@data <- ky.df

palky<-colorQuantile( palette = "Blues", NULL, n=5)

pop<- paste0('<strong',ky$vtdid,'</strong>',
             '<br>CLINTON: ',ky$Clinton,
             '<br>SANDERS: ',ky$Sanders,
             '<br>OMALLEY: ',ky$OMalley,
             '<br>FUENTE: ',ky$Fuente,
             '<br>UNCOMMITTED: ',ky$Uncomitted)

kentucky <- leaflet(data=ky) %>% 
  addTiles() %>% 
  setView(lng=-84.77, lat=37.64, zoom=6) %>% 
  addPolygons(stroke=F, smoothFactor=0.2, fillOpacity = 1, color=~palky(Clinton), popup=pop)