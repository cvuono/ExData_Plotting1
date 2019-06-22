## Load the data

datafile<-"household_power_consumption.txt"
powerdata<-read.table(datafile, header=TRUE, sep=";", na.strings = "?")
powerdata$Date<-as.Date(strptime(powerdata$Date,format="%d/%m/%Y"))
FilteredPowerdata<-filter(powerdata, Date=="2007-02-01" | Date=="2007-02-02")

x<-mutate(FilteredPowerdata, datetime=as.POSIXct(paste(Date, Time)))

## Plot 3
dev.off()
plot(x=x$datetime, y=x$Sub_metering_1, 
     type ="l", 
     xlab = "", 
     ylab = "Energy sub metering",
     lwd=2
)
lines(x=x$datetime, y=x$Sub_metering_2,col="red", lwd=2)
lines(x=x$datetime, y=x$Sub_metering_3, col="blue", lwd=2)
legend("topright", legend=c("Sub_metering_1", "Sub_meeting_2", "Sub_meeting_3"), lwd=2, col=c("black","red","blue"))
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()