NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- aggregate(Emissions ~ year, NEI, sum)
png(filename = "plot1.png")
    barplot(height = data$Emissions, names.arg = data$year, ylab = "Total Emissions (tons)", xlab = "year")
dev.off()