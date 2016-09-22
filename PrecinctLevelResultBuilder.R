.libPaths('C:/R-Lib')

options(stringsAsFactors = F)


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

fips<-read.csv('KYFIPS.csv')


summary<-list()
summary[['adair']]<-fromJSON('KY_Primary_Full/Adair-KY-61323-168222-summary.txt')['Contests']
summary[['allen']]<-fromJSON('KY_Primary_Full/Allen-KY-61323-168222-summary.txt')['Contests']
summary[['anderson']]<-fromJSON('KY_Primary_Full/Anderson-KY-61323-168222-summary.txt')['Contests']
summary[['ballard']]<-fromJSON('KY_Primary_Full/Ballard-KY-61323-168222-summary.txt')['Contests']
summary[['barren']]<-fromJSON('KY_Primary_Full/Barren-KY-61323-168222-summary.txt')['Contests']
summary[['bath']]<-fromJSON('KY_Primary_Full/Bath-KY-61323-168222-summary.txt')['Contests']
summary[['bell']]<-fromJSON('KY_Primary_Full/Bell-KY-61323-168222-summary.txt')['Contests']
summary[['boone']]<-fromJSON('KY_Primary_Full/Boone-KY-61323-168222-summary.txt')['Contests']
summary[['bourbon']]<-fromJSON('KY_Primary_Full/Bourbon-KY-61323-168222-summary.txt')['Contests']
summary[['boyd']]<-fromJSON('KY_Primary_Full/Boyd-KY-61323-168222-summary.txt')['Contests']
summary[['boyle']]<-fromJSON('KY_Primary_Full/Boyle-KY-61323-168222-summary.txt')['Contests']
summary[['bracken']]<-fromJSON('KY_Primary_Full/Bracken-KY-61323-168222-summary.txt')['Contests']
summary[['breathitt']]<-fromJSON('KY_Primary_Full/Breathitt-KY-61323-168222-summary.txt')['Contests']
summary[['breckinridge']]<-fromJSON('KY_Primary_Full/Breckinridge-KY-61323-168222-summary.txt')['Contests']
summary[['bullitt']]<-fromJSON('KY_Primary_Full/Bullitt-KY-61323-168222-summary.txt')['Contests']
summary[['butler']]<-fromJSON('KY_Primary_Full/Butler-KY-61323-168222-summary.txt')['Contests']
summary[['caldwell']]<-fromJSON('KY_Primary_Full/Caldwell-KY-61323-168222-summary.txt')['Contests']
summary[['calloway']]<-fromJSON('KY_Primary_Full/Calloway-KY-61323-168222-summary.txt')['Contests']
summary[['campbell']]<-fromJSON('KY_Primary_Full/Campbell-KY-61323-168222-summary.txt')['Contests']
summary[['carlisle']]<-fromJSON('KY_Primary_Full/Carlisle-KY-61323-168222-summary.txt')['Contests']
summary[['carroll']]<-fromJSON('KY_Primary_Full/Carroll-KY-61323-168222-summary.txt')['Contests']
summary[['carter']]<-fromJSON('KY_Primary_Full/Carter-KY-61323-168222-summary.txt')['Contests']
summary[['casey']]<-fromJSON('KY_Primary_Full/Casey-KY-61323-168222-summary.txt')['Contests']
summary[['christian']]<-fromJSON('KY_Primary_Full/Christian-KY-61323-168222-summary.txt')['Contests']
summary[['clark']]<-fromJSON('KY_Primary_Full/Clark-KY-61323-168222-summary.txt')['Contests']
summary[['clay']]<-fromJSON('KY_Primary_Full/Clay-KY-61323-168222-summary.txt')['Contests']
summary[['clinton']]<-fromJSON('KY_Primary_Full/Clinton-KY-61323-168222-summary.txt')['Contests']
summary[['crittenden']]<-fromJSON('KY_Primary_Full/Crittenden-KY-61323-168222-summary.txt')['Contests']
summary[['cumberland']]<-fromJSON('KY_Primary_Full/Cumberland-KY-61323-168222-summary.txt')['Contests']
summary[['daviess']]<-fromJSON('KY_Primary_Full/Daviess-KY-61323-168222-summary.txt')['Contests']
summary[['edmonson']]<-fromJSON('KY_Primary_Full/Edmonson-KY-61323-168222-summary.txt')['Contests']
summary[['elliott']]<-fromJSON('KY_Primary_Full/elliott-KY-61323-168222-summary.txt')['Contests']
summary[['estill']]<-fromJSON('KY_Primary_Full/estill-KY-61323-168222-summary.txt')['Contests']
summary[['fayette']]<-fromJSON('KY_Primary_Full/Fayette-KY-61323-168222-summary.txt')['Contests']
summary[['fleming']]<-fromJSON('KY_Primary_Full/Fleming-KY-61323-168222-summary.txt')['Contests']
summary[['floyd']]<-fromJSON('KY_Primary_Full/Floyd-KY-61323-168222-summary.txt')['Contests']
summary[['franklin']]<-fromJSON('KY_Primary_Full/Franklin-KY-61323-168222-summary.txt')['Contests']
summary[['fulton']]<-fromJSON('KY_Primary_Full/Fulton-KY-61323-168222-summary.txt')['Contests']
summary[['gallatin']]<-fromJSON('KY_Primary_Full/Gallatin-KY-61323-168222-summary.txt')['Contests']
summary[['garrard']]<-fromJSON('KY_Primary_Full/Garrard-KY-61323-168222-summary.txt')['Contests']
summary[['grant']]<-fromJSON('KY_Primary_Full/Grant-KY-61323-168222-summary.txt')['Contests']
summary[['graves']]<-fromJSON('KY_Primary_Full/Graves-KY-61323-168222-summary.txt')['Contests']
summary[['grayson']]<-fromJSON('KY_Primary_Full/Grayson-KY-61323-168222-summary.txt')['Contests']
summary[['green']]<-fromJSON('KY_Primary_Full/Green-KY-61323-168222-summary.txt')['Contests']
summary[['greenup']]<-fromJSON('KY_Primary_Full/Greenup-KY-61323-168222-summary.txt')['Contests']
summary[['hancock']]<-fromJSON('KY_Primary_Full/Hancock-KY-61323-168222-summary.txt')['Contests']
summary[['hardin']]<-fromJSON('KY_Primary_Full/Hardin-KY-61323-168222-summary.txt')['Contests']
summary[['harlan']]<-fromJSON('KY_Primary_Full/Harlan-KY-61323-168222-summary.txt')['Contests']
summary[['harrison']]<-fromJSON('KY_Primary_Full/Harrison-KY-61323-168222-summary.txt')['Contests']
summary[['hart']]<-fromJSON('KY_Primary_Full/Hart-KY-61323-168222-summary.txt')['Contests']
summary[['henderson']]<-fromJSON('KY_Primary_Full/Henderson-KY-61323-168222-summary.txt')['Contests']
summary[['henry']]<-fromJSON('KY_Primary_Full/Henry-KY-61323-168222-summary.txt')['Contests']
summary[['hickman']]<-fromJSON('KY_Primary_Full/Hickman-KY-61323-168222-summary.txt')['Contests']
summary[['hopkins']]<-fromJSON('KY_Primary_Full/Hopkins-KY-61323-168222-summary.txt')['Contests']
summary[['jackson']]<-fromJSON('KY_Primary_Full/jackson-KY-61323-168222-summary.txt')['Contests']
summary[['jefferson']]<-fromJSON('KY_Primary_Full/Jefferson-KY-61323-168222-summary.txt')['Contests']
summary[['jessamine']]<-fromJSON('KY_Primary_Full/Jessamine-KY-61323-168222-summary.txt')['Contests']
summary[['johnson']]<-fromJSON('KY_Primary_Full/Johnson-KY-61323-168222-summary.txt')['Contests']
summary[['kenton']]<-fromJSON('KY_Primary_Full/Kenton-KY-61323-168222-summary.txt')['Contests']
summary[['knott']]<-fromJSON('KY_Primary_Full/Knott-KY-61323-168222-summary.txt')['Contests']
summary[['knox']]<-fromJSON('KY_Primary_Full/Knox-KY-61323-168222-summary.txt')['Contests']
summary[['larue']]<-fromJSON('KY_Primary_Full/Larue-KY-61323-168222-summary.txt')['Contests']
summary[['laurel']]<-fromJSON('KY_Primary_Full/Laurel-KY-61323-168222-summary.txt')['Contests']
summary[['lawrence']]<-fromJSON('KY_Primary_Full/Lawrence-KY-61323-168222-summary.txt')['Contests']
summary[['lee']]<-fromJSON('KY_Primary_Full/Lee-KY-61323-168222-summary.txt')['Contests']
summary[['leslie']]<-fromJSON('KY_Primary_Full/Leslie-KY-61323-168222-summary.txt')['Contests']
summary[['letcher']]<-fromJSON('KY_Primary_Full/Letcher-KY-61323-168222-summary.txt')['Contests']
summary[['lewis']]<-fromJSON('KY_Primary_Full/Lewis-KY-61323-168222-summary.txt')['Contests']
summary[['lincoln']]<-fromJSON('KY_Primary_Full/Lincoln-KY-61323-168222-summary.txt')['Contests']
summary[['livingston']]<-fromJSON('KY_Primary_Full/Livingston-KY-61323-168222-summary.txt')['Contests']
summary[['logan']]<-fromJSON('KY_Primary_Full/Logan-KY-61323-168222-summary.txt')['Contests']
summary[['lyon']]<-fromJSON('KY_Primary_Full/Lyon-KY-61323-168222-summary.txt')['Contests']
summary[['madison']]<-fromJSON('KY_Primary_Full/Madison-KY-61323-168222-summary.txt')['Contests']
summary[['magoffin']]<-fromJSON('KY_Primary_Full/Magoffin-KY-61323-168222-summary.txt')['Contests']
summary[['marion']]<-fromJSON('KY_Primary_Full/Marion-KY-61323-168222-summary.txt')['Contests']
summary[['marshall']]<-fromJSON('KY_Primary_Full/Marshall-KY-61323-168222-summary.txt')['Contests']
summary[['martin']]<-fromJSON('KY_Primary_Full/Martin-KY-61323-168222-summary.txt')['Contests']
summary[['mason']]<-fromJSON('KY_Primary_Full/Mason-KY-61323-168222-summary.txt')['Contests']
summary[['mccracken']]<-fromJSON('KY_Primary_Full/McCracken-KY-61323-168222-summary.txt')['Contests']
summary[['mccreary']]<-fromJSON('KY_Primary_Full/McCreary-KY-61323-168222-summary.txt')['Contests']
summary[['mclean']]<-fromJSON('KY_Primary_Full/McLean-KY-61323-168222-summary.txt')['Contests']
summary[['meade']]<-fromJSON('KY_Primary_Full/Meade-KY-61323-168222-summary.txt')['Contests']
summary[['menifee']]<-fromJSON('KY_Primary_Full/Menifee-KY-61323-168222-summary.txt')['Contests']
summary[['mercer']]<-fromJSON('KY_Primary_Full/Mercer-KY-61323-168222-summary.txt')['Contests']
summary[['metcalfe']]<-fromJSON('KY_Primary_Full/Metcalfe-KY-61323-168222-summary.txt')['Contests']
summary[['monroe']]<-fromJSON('KY_Primary_Full/Monroe-KY-61323-168222-summary.txt')['Contests']
summary[['montgomery']]<-fromJSON('KY_Primary_Full/Montgomery-KY-61323-168222-summary.txt')['Contests']
summary[['morgan']]<-fromJSON('KY_Primary_Full/Morgan-KY-61323-168222-summary.txt')['Contests']
summary[['muhlenberg']]<-fromJSON('KY_Primary_Full/Muhlenberg-KY-61323-168222-summary.txt')['Contests']
summary[['nelson']]<-fromJSON('KY_Primary_Full/Nelson-KY-61323-168222-summary.txt')['Contests']
summary[['nicholas']]<-fromJSON('KY_Primary_Full/Nicholas-KY-61323-168222-summary.txt')['Contests']
summary[['ohio']]<-fromJSON('KY_Primary_Full/Ohio-KY-61323-168222-summary.txt')['Contests']
summary[['oldham']]<-fromJSON('KY_Primary_Full/Oldham-KY-61323-168222-summary.txt')['Contests']
summary[['owen']]<-fromJSON('KY_Primary_Full/Owen-KY-61323-168222-summary.txt')['Contests']
summary[['owsley']]<-fromJSON('KY_Primary_Full/Owsley-KY-61323-168222-summary.txt')['Contests']
summary[['pendleton']]<-fromJSON('KY_Primary_Full/Pendleton-KY-61323-168222-summary.txt')['Contests']
summary[['perry']]<-fromJSON('KY_Primary_Full/Perry-KY-61323-168222-summary.txt')['Contests']
summary[['pike']]<-fromJSON('KY_Primary_Full/Pike-KY-61323-168222-summary.txt')['Contests']
summary[['powell']]<-fromJSON('KY_Primary_Full/Powell-KY-61323-168222-summary.txt')['Contests']
summary[['pulaski']]<-fromJSON('KY_Primary_Full/Pulaski-KY-61323-168222-summary.txt')['Contests']
summary[['robertson']]<-fromJSON('KY_Primary_Full/Robertson-KY-61323-168222-summary.txt')['Contests']
summary[['rockcastle']]<-fromJSON('KY_Primary_Full/Rockcastle-KY-61323-168222-summary.txt')['Contests']
summary[['rowan']]<-fromJSON('KY_Primary_Full/Rowan-KY-61323-168222-summary.txt')['Contests']
summary[['russell']]<-fromJSON('KY_Primary_Full/Russell-KY-61323-168222-summary.txt')['Contests']
summary[['scott']]<-fromJSON('KY_Primary_Full/Scott-KY-61323-168222-summary.txt')['Contests']
summary[['shelby']]<-fromJSON('KY_Primary_Full/Shelby-KY-61323-168222-summary.txt')['Contests']
summary[['simpson']]<-fromJSON('KY_Primary_Full/Simpson-KY-61323-168222-summary.txt')['Contests']
summary[['spencer']]<-fromJSON('KY_Primary_Full/Spencer-KY-61323-168222-summary.txt')['Contests']
summary[['taylor']]<-fromJSON('KY_Primary_Full/Taylor-KY-61323-168222-summary.txt')['Contests']
summary[['todd']]<-fromJSON('KY_Primary_Full/Todd-KY-61323-168222-summary.txt')['Contests']
summary[['trigg']]<-fromJSON('KY_Primary_Full/Trigg-KY-61323-168222-summary.txt')['Contests']
summary[['trimble']]<-fromJSON('KY_Primary_Full/Trimble-KY-61323-168222-summary.txt')['Contests']
summary[['union']]<-fromJSON('KY_Primary_Full/Union-KY-61323-168222-summary.txt')['Contests']
summary[['warren']]<-fromJSON('KY_Primary_Full/Warren-KY-61323-168222-summary.txt')['Contests']
summary[['washington']]<-fromJSON('KY_Primary_Full/Washington-KY-61323-168222-summary.txt')['Contests']
summary[['wayne']]<-fromJSON('KY_Primary_Full/Wayne-KY-61323-168222-summary.txt')['Contests']
summary[['webster']]<-fromJSON('KY_Primary_Full/Webster-KY-61323-168222-summary.txt')['Contests']
summary[['whitley']]<-fromJSON('KY_Primary_Full/Whitley-KY-61323-168222-summary.txt')['Contests']
summary[['wolfe']]<-fromJSON('KY_Primary_Full/Wolfe-KY-61323-168222-summary.txt')['Contests']
summary[['woodford']]<-fromJSON('KY_Primary_Full/Woodford-KY-61323-168222-summary.txt')['Contests']



results<-list()
results[['adair']]<-fromJSON('KY_Primary_Full/Adair-KY-61323-168222.txt')['Contests']
results[['allen']]<-fromJSON('KY_Primary_Full/Allen-KY-61323-168222.txt')['Contests']
results[['anderson']]<-fromJSON('KY_Primary_Full/Anderson-KY-61323-168222.txt')['Contests']
results[['ballard']]<-fromJSON('KY_Primary_Full/Ballard-KY-61323-168222.txt')['Contests']
results[['barren']]<-fromJSON('KY_Primary_Full/Barren-KY-61323-168222.txt')['Contests']
results[['bath']]<-fromJSON('KY_Primary_Full/Bath-KY-61323-168222.txt')['Contests']
results[['bell']]<-fromJSON('KY_Primary_Full/Bell-KY-61323-168222.txt')['Contests']
results[['boone']]<-fromJSON('KY_Primary_Full/Boone-KY-61323-168222.txt')['Contests']
results[['bourbon']]<-fromJSON('KY_Primary_Full/Bourbon-KY-61323-168222.txt')['Contests']
results[['boyd']]<-fromJSON('KY_Primary_Full/Boyd-KY-61323-168222.txt')['Contests']
results[['boyle']]<-fromJSON('KY_Primary_Full/Boyle-KY-61323-168222.txt')['Contests']
results[['bracken']]<-fromJSON('KY_Primary_Full/Bracken-KY-61323-168222.txt')['Contests']
results[['breathitt']]<-fromJSON('KY_Primary_Full/Breathitt-KY-61323-168222.txt')['Contests']
results[['breckinridge']]<-fromJSON('KY_Primary_Full/Breckinridge-KY-61323-168222.txt')['Contests']
results[['bullitt']]<-fromJSON('KY_Primary_Full/Bullitt-KY-61323-168222.txt')['Contests']
results[['butler']]<-fromJSON('KY_Primary_Full/Butler-KY-61323-168222.txt')['Contests']
results[['caldwell']]<-fromJSON('KY_Primary_Full/Caldwell-KY-61323-168222.txt')['Contests']
results[['calloway']]<-fromJSON('KY_Primary_Full/Calloway-KY-61323-168222.txt')['Contests']
results[['campbell']]<-fromJSON('KY_Primary_Full/Campbell-KY-61323-168222.txt')['Contests']
results[['carlisle']]<-fromJSON('KY_Primary_Full/Carlisle-KY-61323-168222.txt')['Contests']
results[['carroll']]<-fromJSON('KY_Primary_Full/Carroll-KY-61323-168222.txt')['Contests']
results[['carter']]<-fromJSON('KY_Primary_Full/Carter-KY-61323-168222.txt')['Contests']
results[['casey']]<-fromJSON('KY_Primary_Full/Casey-KY-61323-168222.txt')['Contests']
results[['christian']]<-fromJSON('KY_Primary_Full/Christian-KY-61323-168222.txt')['Contests']
results[['clark']]<-fromJSON('KY_Primary_Full/Clark-KY-61323-168222.txt')['Contests']
results[['clay']]<-fromJSON('KY_Primary_Full/Clay-KY-61323-168222.txt')['Contests']
results[['clinton']]<-fromJSON('KY_Primary_Full/Clinton-KY-61323-168222.txt')['Contests']
results[['crittenden']]<-fromJSON('KY_Primary_Full/Crittenden-KY-61323-168222.txt')['Contests']
results[['cumberland']]<-fromJSON('KY_Primary_Full/Cumberland-KY-61323-168222.txt')['Contests']
results[['daviess']]<-fromJSON('KY_Primary_Full/Daviess-KY-61323-168222.txt')['Contests']
results[['edmonson']]<-fromJSON('KY_Primary_Full/Edmonson-KY-61323-168222.txt')['Contests']
results[['elliott']]<-fromJSON('KY_Primary_Full/elliott-KY-61323-168222.txt')['Contests']
results[['estill']]<-fromJSON('KY_Primary_Full/estill-KY-61323-168222.txt')['Contests']
results[['fayette']]<-fromJSON('KY_Primary_Full/Fayette-KY-61323-168222.txt')['Contests']
results[['fleming']]<-fromJSON('KY_Primary_Full/Fleming-KY-61323-168222.txt')['Contests']
results[['floyd']]<-fromJSON('KY_Primary_Full/Floyd-KY-61323-168222.txt')['Contests']
results[['franklin']]<-fromJSON('KY_Primary_Full/Franklin-KY-61323-168222.txt')['Contests']
results[['fulton']]<-fromJSON('KY_Primary_Full/Fulton-KY-61323-168222.txt')['Contests']
results[['gallatin']]<-fromJSON('KY_Primary_Full/Gallatin-KY-61323-168222.txt')['Contests']
results[['garrard']]<-fromJSON('KY_Primary_Full/Garrard-KY-61323-168222.txt')['Contests']
results[['grant']]<-fromJSON('KY_Primary_Full/Grant-KY-61323-168222.txt')['Contests']
results[['graves']]<-fromJSON('KY_Primary_Full/Graves-KY-61323-168222.txt')['Contests']
results[['grayson']]<-fromJSON('KY_Primary_Full/Grayson-KY-61323-168222.txt')['Contests']
results[['green']]<-fromJSON('KY_Primary_Full/Green-KY-61323-168222.txt')['Contests']
results[['greenup']]<-fromJSON('KY_Primary_Full/Greenup-KY-61323-168222.txt')['Contests']
results[['hancock']]<-fromJSON('KY_Primary_Full/Hancock-KY-61323-168222.txt')['Contests']
results[['hardin']]<-fromJSON('KY_Primary_Full/Hardin-KY-61323-168222.txt')['Contests']
results[['harlan']]<-fromJSON('KY_Primary_Full/Harlan-KY-61323-168222.txt')['Contests']
results[['harrison']]<-fromJSON('KY_Primary_Full/Harrison-KY-61323-168222.txt')['Contests']
results[['hart']]<-fromJSON('KY_Primary_Full/Hart-KY-61323-168222.txt')['Contests']
results[['henderson']]<-fromJSON('KY_Primary_Full/Henderson-KY-61323-168222.txt')['Contests']
results[['henry']]<-fromJSON('KY_Primary_Full/Henry-KY-61323-168222.txt')['Contests']
results[['hickman']]<-fromJSON('KY_Primary_Full/Hickman-KY-61323-168222.txt')['Contests']
results[['hopkins']]<-fromJSON('KY_Primary_Full/Hopkins-KY-61323-168222.txt')['Contests']
results[['jackson']]<-fromJSON('KY_Primary_Full/jackson-KY-61323-168222.txt')['Contests']
results[['jefferson']]<-fromJSON('KY_Primary_Full/Jefferson-KY-61323-168222.txt')['Contests']
results[['jessamine']]<-fromJSON('KY_Primary_Full/Jessamine-KY-61323-168222.txt')['Contests']
results[['johnson']]<-fromJSON('KY_Primary_Full/Johnson-KY-61323-168222.txt')['Contests']
results[['kenton']]<-fromJSON('KY_Primary_Full/Kenton-KY-61323-168222.txt')['Contests']
results[['knott']]<-fromJSON('KY_Primary_Full/Knott-KY-61323-168222.txt')['Contests']
results[['knox']]<-fromJSON('KY_Primary_Full/Knox-KY-61323-168222.txt')['Contests']
results[['larue']]<-fromJSON('KY_Primary_Full/Larue-KY-61323-168222.txt')['Contests']
results[['laurel']]<-fromJSON('KY_Primary_Full/Laurel-KY-61323-168222.txt')['Contests']
results[['lawrence']]<-fromJSON('KY_Primary_Full/Lawrence-KY-61323-168222.txt')['Contests']
results[['lee']]<-fromJSON('KY_Primary_Full/Lee-KY-61323-168222.txt')['Contests']
results[['leslie']]<-fromJSON('KY_Primary_Full/Leslie-KY-61323-168222.txt')['Contests']
results[['letcher']]<-fromJSON('KY_Primary_Full/Letcher-KY-61323-168222.txt')['Contests']
results[['lewis']]<-fromJSON('KY_Primary_Full/Lewis-KY-61323-168222.txt')['Contests']
results[['lincoln']]<-fromJSON('KY_Primary_Full/Lincoln-KY-61323-168222.txt')['Contests']
results[['livingston']]<-fromJSON('KY_Primary_Full/Livingston-KY-61323-168222.txt')['Contests']
results[['logan']]<-fromJSON('KY_Primary_Full/Logan-KY-61323-168222.txt')['Contests']
results[['lyon']]<-fromJSON('KY_Primary_Full/Lyon-KY-61323-168222.txt')['Contests']
results[['madison']]<-fromJSON('KY_Primary_Full/Madison-KY-61323-168222.txt')['Contests']
results[['magoffin']]<-fromJSON('KY_Primary_Full/Magoffin-KY-61323-168222.txt')['Contests']
results[['marion']]<-fromJSON('KY_Primary_Full/Marion-KY-61323-168222.txt')['Contests']
results[['marshall']]<-fromJSON('KY_Primary_Full/Marshall-KY-61323-168222.txt')['Contests']
results[['martin']]<-fromJSON('KY_Primary_Full/Martin-KY-61323-168222.txt')['Contests']
results[['mason']]<-fromJSON('KY_Primary_Full/Mason-KY-61323-168222.txt')['Contests']
results[['mccracken']]<-fromJSON('KY_Primary_Full/McCracken-KY-61323-168222.txt')['Contests']
results[['mccreary']]<-fromJSON('KY_Primary_Full/McCreary-KY-61323-168222.txt')['Contests']
results[['mclean']]<-fromJSON('KY_Primary_Full/McLean-KY-61323-168222.txt')['Contests']
results[['meade']]<-fromJSON('KY_Primary_Full/Meade-KY-61323-168222.txt')['Contests']
results[['menifee']]<-fromJSON('KY_Primary_Full/Menifee-KY-61323-168222.txt')['Contests']
results[['mercer']]<-fromJSON('KY_Primary_Full/Mercer-KY-61323-168222.txt')['Contests']
results[['metcalfe']]<-fromJSON('KY_Primary_Full/Metcalfe-KY-61323-168222.txt')['Contests']
results[['monroe']]<-fromJSON('KY_Primary_Full/Monroe-KY-61323-168222.txt')['Contests']
results[['montgomery']]<-fromJSON('KY_Primary_Full/Montgomery-KY-61323-168222.txt')['Contests']
results[['morgan']]<-fromJSON('KY_Primary_Full/Morgan-KY-61323-168222.txt')['Contests']
results[['muhlenberg']]<-fromJSON('KY_Primary_Full/Muhlenberg-KY-61323-168222.txt')['Contests']
results[['nelson']]<-fromJSON('KY_Primary_Full/Nelson-KY-61323-168222.txt')['Contests']
results[['nicholas']]<-fromJSON('KY_Primary_Full/Nicholas-KY-61323-168222.txt')['Contests']
results[['ohio']]<-fromJSON('KY_Primary_Full/Ohio-KY-61323-168222.txt')['Contests']
results[['oldham']]<-fromJSON('KY_Primary_Full/Oldham-KY-61323-168222.txt')['Contests']
results[['owen']]<-fromJSON('KY_Primary_Full/Owen-KY-61323-168222.txt')['Contests']
results[['owsley']]<-fromJSON('KY_Primary_Full/Owsley-KY-61323-168222.txt')['Contests']
results[['pendleton']]<-fromJSON('KY_Primary_Full/Pendleton-KY-61323-168222.txt')['Contests']
results[['perry']]<-fromJSON('KY_Primary_Full/Perry-KY-61323-168222.txt')['Contests']
results[['pike']]<-fromJSON('KY_Primary_Full/Pike-KY-61323-168222.txt')['Contests']
results[['powell']]<-fromJSON('KY_Primary_Full/Powell-KY-61323-168222.txt')['Contests']
results[['pulaski']]<-fromJSON('KY_Primary_Full/Pulaski-KY-61323-168222.txt')['Contests']
results[['robertson']]<-fromJSON('KY_Primary_Full/Robertson-KY-61323-168222.txt')['Contests']
results[['rockcastle']]<-fromJSON('KY_Primary_Full/Rockcastle-KY-61323-168222.txt')['Contests']
results[['rowan']]<-fromJSON('KY_Primary_Full/Rowan-KY-61323-168222.txt')['Contests']
results[['russell']]<-fromJSON('KY_Primary_Full/Russell-KY-61323-168222.txt')['Contests']
results[['scott']]<-fromJSON('KY_Primary_Full/Scott-KY-61323-168222.txt')['Contests']
results[['shelby']]<-fromJSON('KY_Primary_Full/Shelby-KY-61323-168222.txt')['Contests']
results[['simpson']]<-fromJSON('KY_Primary_Full/Simpson-KY-61323-168222.txt')['Contests']
results[['spencer']]<-fromJSON('KY_Primary_Full/Spencer-KY-61323-168222.txt')['Contests']
results[['taylor']]<-fromJSON('KY_Primary_Full/Taylor-KY-61323-168222.txt')['Contests']
results[['todd']]<-fromJSON('KY_Primary_Full/Todd-KY-61323-168222.txt')['Contests']
results[['trigg']]<-fromJSON('KY_Primary_Full/Trigg-KY-61323-168222.txt')['Contests']
results[['trimble']]<-fromJSON('KY_Primary_Full/Trimble-KY-61323-168222.txt')['Contests']
results[['union']]<-fromJSON('KY_Primary_Full/Union-KY-61323-168222.txt')['Contests']
results[['warren']]<-fromJSON('KY_Primary_Full/Warren-KY-61323-168222.txt')['Contests']
results[['washington']]<-fromJSON('KY_Primary_Full/Washington-KY-61323-168222.txt')['Contests']
results[['wayne']]<-fromJSON('KY_Primary_Full/Wayne-KY-61323-168222.txt')['Contests']
results[['webster']]<-fromJSON('KY_Primary_Full/Webster-KY-61323-168222.txt')['Contests']
results[['whitley']]<-fromJSON('KY_Primary_Full/Whitley-KY-61323-168222.txt')['Contests']
results[['wolfe']]<-fromJSON('KY_Primary_Full/Wolfe-KY-61323-168222.txt')['Contests']
results[['woodford']]<-fromJSON('KY_Primary_Full/Woodford-KY-61323-168222.txt')['Contests']

races<-vector('character')
for(i in 1:length(summary)){
  races<-c(races, summary[[i]][['Contests']][['C']]) %>% unique()
}

# races[3] == "President of the United States - DEMOCRAT"

result_builder<-function(race){
  county_reference_table<-data.frame(county = names(summary))
  county_reference_table$K<-sapply(county_reference_table$county, function(i){
    if(race %in% summary[[i]][['Contests']][['C']]){
      summary[[i]][['Contests']][['K']][which(summary[[i]][['Contests']][['C']] == race)]
    }else{
      NA
    }
  })
  
  county_reference_table<-filter(county_reference_table, !is.na(K))
  
  votesFunc<-function(county){
    if(county_reference_table$K[which(county_reference_table$county==county)] %>% is.na){
      return(NULL)
    }else{
      fip<-fips$FIP[which(fips$county==county)]
      race_ref<-which(results[[county]]$Contests$K == county_reference_table$K[which(county_reference_table$county==county)])
      df<-results[[county]][['Contests']][['V']][[race_ref]] %>% as_tibble()
      colnames(df)<-summary[[county]]$Contests$CH[race_ref] %>% unlist()
      df$region<-results[[county]][['Contests']][['P']][race_ref] %>% unlist()
      df$region<-sapply(df$region,function(i) paste0(fip,i))
      return(df)
    }
  }
  
  precinct_results<-data.frame() %>% as_tibble()
  for(i in 1:length(county_reference_table$county)){
    precinct_results<-rbind(precinct_results, votesFunc(county_reference_table$county[i]))  
  }
  
  return(precinct_results)
}

Presidential<-result_builder(races[3])
DemSenate<-result_builder(races[4])
House46_D<-result_builder(races[58])


# ky <- readOGR(dsn = '.', layer = 'KY Precincts Merged Final')
ky <- readOGR(dsn = '.', layer = 'ky_voting_precinct_geographic_outlines_and_data')

gpclibPermit()

ky@data$id <- rownames(ky@data)
ky.points <- fortify(ky, region='id')
ky.df <- inner_join(ky.points, ky@data, by='id')
ky.df <- filter(ky.df, long<181, long > -90)
ky.df$region <- ky.df$vtd

ky_choropleth<-R6Class("ky_choropleth", inherit=choroplethr::Choropleth, public = list(
  initialize=function(user.df){
    super$initialize(ky.df, user.df)
  }
))

louisville_choropleth<-R6Class("louisville_choropleth", inherit = choroplethr::Choropleth, public = list(
  initialize=function(user.df){
    super$initialize(filter(ky.df, COUNTY == 21111), user.df)
  }
))

lexington_choropleth<-R6Class("louisville_choropleth", inherit = choroplethr::Choropleth, public = list(
    initialize=function(user.df){
      super$initialize(filter(ky.df, COUNTY == 21067), user.df)
    }
    get_reference_map=function(){
      center = c(mean(self$choropleth.df$long), mean(self$choropleth.df$lat))
      max_zoom = MaxZoom(range(self$choropleth.df$lat), range(self$choropleth.df$long))
      get_map(location = center, zoom = max_zoom, color = "bw", source = 'osm')
    }
))



winner<-data.frame(region=Presidential$region)
winner$winner<-sapply(1:length(winner$region), function(i){
  if(which(Presidential[i,][1:5] == Presidential[i,][1:5] %>% max()) %>% length() >1){
    'tie'
  }else{
    names(Presidential[i,][which(Presidential[i,][1:5] == Presidential[i,][1:5] %>% max())])
  }
})
winner$winner<-winner$winner %>% as.factor()
winner$value<-winner$winner

precinct_winner<-ky_choropleth$new(winner)
precinct_winner$title<-'2016 Dem Pres Primary'
precinct_winner$render() + scale_fill_brewer(palette = 'Set1')

lou_precinct_winner<-louisville_choropleth$new(winner)
lou_precinct_winner$title<-'2016 Dem Pres Primary - Jefferson Co, KY'
lou_precinct_winner$legend<-'Winner'
lou_precinct_winner$render_with_reference_map() + scale_fill_brewer(palette = 'Set1')

lex_precinct_winner<-lexington_choropleth$new(winner)
lex_precinct_winner$title<-'2016 Dem Pres Primary - Fayette Co, KY'
lex_precinct_winner$legend<-'Winner'
lex_precinct_winner$render_with_reference_map() + scale_fill_brewer(palette = 'Set1')

# ky.df<-merge(ky.df, winner, 'region')
# ky.df<-merge(ky.df, Presidential, 'region')
# 
# pop<-paste0('<strong>',ky.df$VTDID,'</strong>',
#             '<br>CLINTON: ',ky.df$`Hillary CLINTON`,
#             '<br>SANDERS: ',ky.df$`Bernard 'Bernie' SANDERS`,
#             '<br>OMALLEY: ',ky.df$`Martin J. O'MALLEY`,
#             '<br>DE LA FUENTE: ',ky.df$`Roque Rocky De La FUENTE`,
#             '<br>UNCOMMITTED: ',ky.df$`'UNCOMMITTED'`
#             )
# pal<-colorQuantile("Blues", NULL, n=5)
# factpal<-colorFactor(c('#e41a1c','#377eb8','#4daf4a','#984ea3','#ff7f00'),levels(ky.df$winner))
# 
# map <- leaflet(data=ky) %>% 
#   addTiles() %>%  
#   setView(lng=-85.694006, lat=38.224536, zoom=13) %>% 
#   addPolygons(stroke=F, 
#               smoothFactor=0.2, 
#               fillOpacity = 0.75, 
#               color=~factpal(winner), 
#               popup=pop) %>% 
#   addPolylines(weight=1, color='black') %>% 
#   addLegend("topright", pal=pal,
#             title="Winner By Precinct", values=~c('Clinton','Sanders','OMalley','De La Fuente','Uncommitted'),
#             opacity=1)


missing_precincts<-data.frame(vtd=Presidential$region[!(Presidential$region %in% ky.df$vtd)])
missing_precincts$county<-sapply(substr(missing_precincts$vtd,1,5), function(i) fips$county[which(fips$FIP==i)])
missing_precincts$precinct<-substr(missing_precincts$vtd,6,length(missing_precincts$vtd))
missing_precincts<-filter(missing_precincts, grepl('AB',precinct)==F)
