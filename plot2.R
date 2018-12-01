NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pmBaltimore <- subset(NEI, fips == 24510)
data <- aggregate(Emissions ~ year,pmBaltimore, sum)

png("plot2.png")
    barplot(height = data$Emissions, names.arg = data$year, ylab = "Total Emissions (tons)", xlab = "year")
dev.off()