NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$fips <- as.numeric(NEI$fips)
pm2cities <- subset(NEI, fips %in% c(24510,06037))
pm2cities$fips <- as.factor(pm2cities$fips)
data <- aggregate(Emissions ~ year+fips,pm2cities, sum)

png("plot6.png")
    ggplot(data=data, aes(x=year, y=Emissions, fill=fips)) +
        geom_bar(stat="identity", position=position_dodge())
dev.off()