# Read in the Source Classification file ##
codes<-readRDS("Source_Classification_Code.rds")
##read in the summary scc data   ##
sumSCC<-readRDS("summarySCC_PM25.rds")
## Determine the Codes that are Coal emissions ##
Coal_codes<-codes[grepl("Coal",codes$EI.Sector),]
## Get the subset of the SCC dataset that is Coal ##
sumSCC_Coal<-sumSCC[(sumSCC$SCC %in% Coal_codes$SCC),]
#organize the coal data ##
meltcoal<-melt(sumSCC_Coal,id.vars=c("year"),measure.vars="Emissions")
castcoal<-cast(meltcoal,year~variable,sum)
png(file="plot1.png")
## plot  ##

## close png device  ##
dev.off()
