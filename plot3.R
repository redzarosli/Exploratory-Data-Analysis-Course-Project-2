NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pmBaltimore <- subset(NEI, fips == 24510)
data <- aggregate(Emissions ~ year+type, pmBaltimore, sum)

png("plot3.png")
ggplot(data=data, aes(x=year, y=Emissions, fill=type)) +
    geom_bar(stat="identity", position=position_dodge())
dev.off()

