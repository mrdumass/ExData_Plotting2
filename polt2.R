## Read in the Source Classification file ##
sc<-readRDS("Source_Classification_Code.rds")
##read in the summary scc data   ##
sumSCC<-readRDS("summarySCC_PM25.rds")
##get the data only for baltimre##
baltimore<-(sumSCC[(sumSCC$fips==24510),])
rm(sumSCC)
## get the baltimore total emmissions per year ##
baltimore$Emissions<-as.numeric(baltimore$Emissions)
baltimore$type<-as.factor(baltimore$type)
baltemissions<-tapply(baltimore$Emissions,baltimore$year,sum)
png(file="plot2.png")
## plot points ##
qplot(baltimore$year,baltimore$Emissions,data=baltimore,facets=.~type)
## close png device  ##
dev.off()
