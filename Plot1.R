setwd("~/Training/CourseraDataScience/4Exploratory/Week3/exdata-data-NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#To put the images in a better directory...
setwd("~/Training/CourseraDataScience/4Exploratory/Week3/")

#Have total emissions decreased from 1999 to 2008? 

png("Plot1.png", width=480, height=480)

with(aggregate(NEI$Emissions, list(year = NEI$year), sum), plot(year, x, type = "l", main = "PM2.5 Levels Over Time", ylab = "Total PM2.5", xlab = "Year"))

dev.off()