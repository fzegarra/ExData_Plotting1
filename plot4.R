## Reading the data using read.table()
## Notice that the file was saved before under the working directory folder
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
## Subsetting the days that we need for analisys
x<-data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
## Pasting the data Date/Time to build the graphic. Is 
## recommended the use of the function "attach" that allow us to access the  
## database using names only for memory usage purposes.
attach(x)
y<-paste(Date, Time)
## Formatting the data in DataTime column
x$DateTime<-strptime(y, "%d/%m/%Y %H:%M:%S")
## Creating the png file
png(filename = "plot4.png", width = 480, height = 480)
## Formating multiple figures for the png file
par(mfrow=c(2,2))
## When using mfrow the sequence of the figures is: 1)Top left; 2)Top rigth;
## 3) Bottom left; 4) Bottom rigth.
plot(x$DateTime, x$Global_active_power, type="l", col="black", ylab="Global Active Power",xlab="")
plot(x$DateTime, x$Voltage, type="l", col="black", ylab="Voltage",xlab="datetime")
plot(x$DateTime, x$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metring")
lines(x$DateTime, x$Sub_metering_2, col="red")
lines(x$DateTime, x$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
plot(x$DateTime, x$Global_reactive_power, type="l", col="black", xlab="", ylab="Global_reactive_power")
dev.off()


