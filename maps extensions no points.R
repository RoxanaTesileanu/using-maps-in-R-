library(rgdal)
library(sp)
library(rgeos)
library(maptools)
library(dismo)
library(XML)
library(raster)
library(rasterVis)

romania<- gmap("Romania")
plot(romania, inter=TRUE)
select.area<-drawExtent()

cale_harta<- "/home/roxana/private/harta_RO.bmp"
bmp(cale_harta, width=200, height = 200)
plot(romania)
dev.off()

romania_sat<- gmap("Romania", type="satellite")
plot(romania_sat)

#choose zoom level with exp=

romania_sat2<-gmap("Romania", type="satellite", exp=2)
plot(romania_sat2)


#plot selected area
map_file<- gmap("Romania", type="satellite", filename="romania.gmap")
plot(map_file)
select.area<-drawExtent()
mymap<- gmap(select.area, filename="bucatica") # now open the file to get the map
plot(mymap)

#harta BV 
#terrain=3D sehr cool (wenn nicht ala .gmap sondern als .gif); 
#satellite = satellite, 
#hybrid = beide satellite and Ortsnamen Strassen etc.
map_file_BV<- gmap("Romania, Brasov", type="hybrid", filename = "BVhybrid.gmap")
map_file_BVcool<- gmap("Romania, Brasov", type="hybrid", filename="BVcool")
map_flie_BV2<-gmap("Brasov, Romania", type="satellite", filename = "BVsat")
map_flie_BV3<-gmap("Brasov, Romania", type="terrain", filename = "BV2")



?gmap


geocode("Sacele, Brasov, Romania") # use the geocode function to get the lonlat for a city
# derive the extent to be ploted by means of the lonlat returned by geocode for a city, or the coord. of the points recorded in the field

e<-extent(25.64934, 25.77204, 45.55626, 45.62877) # extent of Sacele
map.extent<- gmap(e, filename = "Sacele")
mypoint<-matrix(c(25.69425, 45.61798), ncol=2)
mypointM<- Mercator(mypoint)

plotmypoint<- plot(map.extent)
points(mypointM)
map.extent.mypoint<- gmap(e, filename = "Sacele", mypointM)

library(RgoogleMaps) # get base maps from Google

#daca dai un punct lonlat si faci zoom 
newnap1<-GetMap(center= c(45.6, 25.6), zoom= 10, 
                destfile="zona BV.png", maptype = "terrain")




