## Reading the data using read.table()
## Notice that the file was saved before under the working directory folder
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
## Subsetting the days that we need for analisys
x<-data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
## Pasting the data Date/Time to build the graphic. Is 
## recommended the use of the function "attach" that allow us to access the  
## database using names only.
attach(x)
y<-paste(Date, Time)
## Formatting the data in DataTime column
x$DateTime<-strptime(y, "%d/%m/%Y %H:%M:%S")
## Creating the png file
png(filename = "plot2.png", 
    width = 480, height = 480)
plot(x$DateTime, x$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()



