## Load the data

datafile<-"household_power_consumption.txt"
powerdata<-read.table(datafile, header=TRUE, sep=";", na.strings = "?")
powerdata$Date<-as.Date(strptime(powerdata$Date,format="%d/%m/%Y"))
FilteredPowerdata<-filter(powerdata, Date=="2007-02-01" | Date=="2007-02-02")

x<-mutate(FilteredPowerdata, datetime=as.POSIXct(paste(Date, Time)))

## Plot 4
dev.off()
par(mfrow=c(2,2))
plot(x$Global_active_power~x$datetime, 
     type="l", 
     xlab= "", 
     ylab="Global Active Power (kilowatts)",
     lwd=2
)
plot(x=x$datetime, y=x$Voltage, 
     type="l", 
     col="black",
     xlab="datetime",
     ylab="Voltage",
     lwd=2
)
plot(x=x$datetime, y=x$Sub_metering_1, 
     type ="l", 
     xlab = "", 
     ylab = "Energy sub metering",
     lwd=2
)
lines(x=x$datetime, y=x$Sub_metering_2,col="red", lwd=2)
lines(x=x$datetime, y=x$Sub_metering_3, col="blue", lwd=2)
legend("topright", legend=c("Sub_metering_1", "Sub_meeting_2", "Sub_meeting_3"), lwd=2, col=c("black","red","blue"))
plot(x=x$datetime, y=x$Global_reactive_power, 
     type="l", 
     col="black",
     xlab="datetime",
     ylab="Global_reactive_power",
     lwd=2
)
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
