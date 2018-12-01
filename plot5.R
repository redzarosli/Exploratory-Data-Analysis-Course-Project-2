NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mergedData <- merge(NEI,SCC, by="SCC")
ICEngines <- mergedData[mergedData$SCC.Level.One == "Internal Combustion Engines",]
ICEngines <- aggregate(Emissions ~ year+type, ICEngines, sum)

png("plot5.png")
    barplot(height = ICEngines$Emissions, names.arg = ICEngines$year, ylab = "Total Emissions (tons)", xlab = "year")
dev.off()