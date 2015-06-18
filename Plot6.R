setwd("~/Training/CourseraDataScience/4Exploratory/Week3/exdata-data-NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#To put the images in a better directory...
setwd("~/Training/CourseraDataScience/4Exploratory/Week3/")

library(ggplot2)


#Compare B City with LA (fips = 06037) motor vehicle emissions

merge_ds <- merge(NEI, SCC, by = "SCC") # merge on SCC column

q6ds <- merge_ds[grepl("vehicle", merge_ds$Short.Name, ignore.case = TRUE), ] #ds is just vehicle related

q6ds <- q6ds[q6ds$fips %in% c("06037" , "24510"),] # B City and LA

agg_ds <- aggregate(Emissions ~ year + fips, q6ds, sum) #agg the dataset

g <- ggplot(agg_ds, aes(year,  Emissions, color = fips))

g <- g + geom_line(stat = "identity") + ggtitle("Baltimore City  vs LA Vehicle Emissions Over Time")    

png("Plot6.png", width=480, height=480)

print(g)


dev.off()
