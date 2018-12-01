NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mergedData <- merge(NEI,SCC, by="SCC")
coalEmissions <- grepl("coal", mergedData$Short.Name, ignore.case=TRUE)
coalData <- mergedData[coalEmissions,]
coalData <- aggregate(Emissions ~ year,coalData, sum)

png("plot4.png")
    barplot(height = coalData$Emissions, names.arg = coalData$year, ylab = "Total Emissions (tons)", xlab = "year")
dev.off()

