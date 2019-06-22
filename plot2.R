## Load the data

datafile<-"household_power_consumption.txt"
powerdata<-read.table(datafile, header=TRUE, sep=";", na.strings = "?")
powerdata$Date<-as.Date(strptime(powerdata$Date,format="%d/%m/%Y"))
FilteredPowerdata<-filter(powerdata, Date=="2007-02-01" | Date=="2007-02-02")

x<-mutate(FilteredPowerdata, datetime=as.POSIXct(paste(Date, Time)))

## Plot 2
dev.off()
plot(x$Global_active_power~x$datetime, 
     type="l", 
     xlab= "", 
     ylab="Global Active Power (kilowatts)",
     lwd=2
)
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()