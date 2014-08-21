## Read in the Source Classification file ##
sc<-readRDS("Source_Classification_Code.rds")
##read in the summary scc data   ##
sumSCC<-readRDS("summarySCC_PM25.rds")
##get the data only for baltimre##
baltimore<-(sumSCC[(sumSCC$fips==24510),])
rm(sumSCC)
## find all the codes for vehicles ##
vehicles<-sc[grepl("Vehicles",sc$EI.Sector),]
## get the data set of baltimore just from vehicles ##
baltmv<-baltimore[(baltimore$SCC %in% vehicles$SCC),]
## install reshape package ##
install.packages("reshape")
library(reshape)
## sort and sound for vehicle emissions ##
meltbaltmv<-melt(baltmv,id.vars="year",measure.vars="Emissions")
castbaltmv<-cast(meltbaltmv,year~variable,sum)
## plot  ##
png(file="plot5.png")
plot(castbaltmv$year,castbaltmv$Emissions,main="Vehicle Emissions Baltimore with Regression line",xlab="year",ylab="Emissions (tons)")
a<-lm(castbaltmv$Emissions~castbaltmv$year)
abline(a)
## close png device  ##
dev.off()