setwd("~/Training/CourseraDataScience/4Exploratory/Week3/exdata-data-NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#To put the images in a better directory...
setwd("~/Training/CourseraDataScience/4Exploratory/Week3/")

library(ggplot2)


#Across US how have motor vehicle emissions changed for BALTIMORE CITY

merge_ds <- merge(NEI, SCC, by = "SCC") # merge on SCC column

q5ds <- merge_ds[grepl("vehicle", merge_ds$Short.Name, ignore.case = TRUE), ] #ds is just vehicle related

q5ds <- q5ds[q5ds$fips == "24510", ] # now just B City

agg_ds <- aggregate(Emissions ~ year, q5ds, sum) #agg the dataset

g <- ggplot(agg_ds, aes(year, Emissions))

g <- g + geom_line(stat = "identity")    + ggtitle("Baltimore City Vehicle Emissions Over Time")    

png("Plot5.png", width=480, height=480)

print(g)


dev.off()
