.libPaths('C:/R-Lib')

library('tidyverse')
library('rgdal')
library('gpclib')
library('maptools')
library('mapproj')
library('choroplethrMaps')
library('gridExtra')
library('R6')
library('choroplethr')
library('jsonlite')
library('leaflet')
library('tidyjson')

results<-read.csv('./PresPrimaryKY.csv')

ky <- readOGR(dsn = '.', layer = 'KY Precincts Merged Final')

gpclibPermit()

ky@data$id <- rownames(ky@data)
ky.points <- fortify(ky, region='id')
ky.df <- inner_join(ky.points, ky@data, by='id')
ky.df <- subset(ky.df, long<181)

leaflet(ky) %>% addPolygons(stroke=T)




results.j<-fromJSON('http://results.enr.clarityelections.com/KY/61323/168222/json/status.json')
results.jj<-data.frame(results.j[[1]])
for(i in 2:8) results.jj<-cbind(results.jj, results.j[[i]])
names(results.jj)<-names(results.j[1:8])

PResults<-read.csv('./2016_Primary/DPOTUS.csv')[1:120,]
PResults$County<-paste(PResults$County,"County, KY")
fips<-read.csv('FIPSforMap.csv')
PResults$region<-sapply(PResults$County, function(i) fips$region[which(fips$County==i)]) %>% as.numeric()
PResults$value<-sapply(1:length(PResults$County), function(i){
  PResults$Hillary.CLINTON[i]/sum(PResults$Martin.J..O.MALLEY[i],PResults$Bernard..Bernie..SANDERS[i], PResults$Hillary.CLINTON[i], PResults$Roque.Rocky.De.La.FUENTE[i], PResults$UNCOMMITTED[i])
                           })
county_choropleth(PResults, title="Percent HRC Vote", state_zoom='kentucky')

http<-fromJSON('http://results.enr.clarityelections.com/KY/Adair/61325/168073/json/status.json')
adair<-data.frame(http[[1]])
for(i in 2:6) adair<-cbind(adair, http[[i]])
names(adair)<-names(http[1:6])

# results.jeffco<-readChar('JeffCoResults.json', file.info('JeffCoResults.json')$size)

results.jeffco<-fromJSON('JeffCoResults.json', simplifyDataFrame = T)['Contests']

reference_table<-data.frame(results.jeffco[['Contests']]['A'])
reference_table$reference<-lapply(results.jeffco[['Contests']][['C']],function(i) which(i=='80')) %>% unlist()


jeffco.df<-data.frame(precinct = results.jeffco[['Contests']]['A'])

votesFunc<-function(i,j,k){
  results.jeffco[['Contests']][['V']][[j]][[reference_table$reference[which(i==reference_table$A)]]][k]
}

jeffco.df$OMalley<-mapply(votesFunc, jeffco.df$A, 1:length(jeffco.df$A),1)
jeffco.df$Sanders<-mapply(votesFunc, jeffco.df$A, 1:length(jeffco.df$A),2)
jeffco.df$Clinton<-mapply(votesFunc, jeffco.df$A, 1:length(jeffco.df$A),3)
jeffco.df$DeLaFuente<-mapply(votesFunc, jeffco.df$A, 1:length(jeffco.df$A),4)
jeffco.df$Uncommitted<-mapply(votesFunc, jeffco.df$A, 1:length(jeffco.df$A),5)
