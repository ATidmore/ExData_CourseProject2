setwd("~/Training/CourseraDataScience/4Exploratory/Week3/exdata-data-NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#To put the images in a better directory...
setwd("~/Training/CourseraDataScience/4Exploratory/Week3/")

library(ggplot2)


#Four types of pollutants for Baltimore City?

q3ds  <- NEI[NEI$fips=="24510", ]

agg_ds <- aggregate(Emissions ~ year + type, q3ds, sum) #agg the dataset

g <- ggplot(agg_ds, aes(year, Emissions, color = type)) #year =x, Emissions = y and color= type
g <- g + geom_line() + ggtitle("Trend of Emission Types for Baltimore City")


png("Plot3.png", width=480, height=480)

print(g)


dev.off()
