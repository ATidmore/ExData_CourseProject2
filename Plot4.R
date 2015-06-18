setwd("~/Training/CourseraDataScience/4Exploratory/Week3/exdata-data-NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#To put the images in a better directory...
setwd("~/Training/CourseraDataScience/4Exploratory/Week3/")

library(ggplot2)


#Across US how have coal-related sources changed?

merge_ds <- merge(NEI, SCC, by = "SCC") # merge on SCC column

q4ds <- merge_ds[grepl("coal", merge_ds$Short.Name, ignore.case = TRUE), ] #final ds is just the "coal" records

agg_ds <- aggregate(Emissions ~ year, q4ds, sum) #agg the dataset

g <- ggplot(agg_ds, aes(year, Emissions))

g <- g + geom_line(stat = "identity")    + ggtitle("Coal Emissions Over Time")    #after warning from ggplot2, add stat = 'identity' 

png("Plot4.png", width=480, height=480)

print(g)


dev.off()
