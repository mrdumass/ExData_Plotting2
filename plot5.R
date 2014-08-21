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
meltbaltmv<-melt(baltmv,id.vars=c("year"),id.measure="Emissions")
castbaltmv<-cast(meltbalmv,year~variable,sum)