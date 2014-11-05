## Reading the data using read.table()
## Notice that the file was saved before under the working directory folder
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
## Subsetting the days that we need for analisys
x<-data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
## Creating the png file
png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
## Printing the histogram 
hist(x$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()





