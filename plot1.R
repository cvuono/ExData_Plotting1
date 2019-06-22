## Load the data

datafile<-"household_power_consumption.txt"
powerdata<-read.table(datafile, header=TRUE, sep=";", na.strings = "?")
powerdata$Date<-as.Date(strptime(powerdata$Date,format="%d/%m/%Y"))
FilteredPowerdata<-filter(powerdata, Date=="2007-02-01" | Date=="2007-02-02")

x<-mutate(FilteredPowerdata, datetime=as.POSIXct(paste(Date, Time)))


## Plot 1
dev.off()
hist(x$Global_active_power, 
     col="red", 
     main="Global Active Power",
     xlim=c(0,6),
     ylim=c(0,1200),
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     freq = TRUE)
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
