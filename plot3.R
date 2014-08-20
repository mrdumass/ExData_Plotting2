## add the ggplot2 package ##
install.packages("ggplot2")
library(ggplot2)
## add reshape package ##
install.packages("reshape")
library(reshape)
## Read in the Source Classification file ##
sc<-readRDS("Source_Classification_Code.rds")
##read in the summary scc data   ##
sumSCC<-readRDS("summarySCC_PM25.rds")
##get the data only for baltimore  ##
baltimore<-(sumSCC[(sumSCC$fips==24510),])
rm(sumSCC)
baltimore$Emissions<-as.numeric(baltimore$Emissions)
##sort the total emissions into a datframe by type and year ##
baltmelt<-melt(baltimore,id.vars=c("year","type"),measure.vars="Emissions")
baltcast<-cast(baltmelt,type+year~variable,sum)
png(file="plot3.png")
## plot points ##
bep<-qplot(baltcast$year,baltcast$Emissions,data=baltcast,facets=.~type)
bep
## close png device  ##
dev.off()