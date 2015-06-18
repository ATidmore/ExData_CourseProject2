setwd("~/Training/CourseraDataScience/4Exploratory/Week3/exdata-data-NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#To put the images in a better directory...
setwd("~/Training/CourseraDataScience/4Exploratory/Week3/")

#Have total emissions decreased from 1999 to 2008 in Baltimore City? 

q2ds <- NEI[NEI$fips == "24510",]

png("Plot2.png", width=480, height=480)

with(aggregate(q2ds$Emissions, list(year = q2ds$year), sum), plot(year, x, type = "l", main = "Baltimore City PM2.5", ylab = "Total PM2.5", xlab = "Year"))

dev.off()
