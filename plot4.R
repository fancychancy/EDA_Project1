## Read sample lines from the source to eatablish the dataset classes
dsSample<-read.table(file="C:/Amrith/R/data/EDA/project1/exdata-data-household_power_consumption/household_power_consumption.txt", nrows=200, header=T, sep=";", na.strings="?")
dsClasses<-sapply(dsSample, class)

## Read the complete dataset with the classes identified passed to colClasses
ds<-read.table(file="C:/Amrith/R/data/EDA/project1/exdata-data-household_power_consumption/household_power_consumption.txt", nrows=2075261, header=T, sep=";", colClasses=dsClasses, na.strings="?")

## Convert the Date column from character to Date
ds$Date<-as.Date(ds$Date, format="%d/%m/%Y")

## Subset only the dates that matter
dsTarget<-ds[sample1$Date=="2007-02-01" | sample1$Date=="2007-02-02", ]

## merge the date and time columns and convert it to a POSIX class object
dsTarget$DT<-paste(dsTarget$Date, dsTarget$Time)
dsTarget$DT<-as.POSIXlt(dsTarget$DT)

## plot 4
png(filename="plot4.png", width=480, height=480, units="px")
par(mar = c(4, 4, 1, 1))
par(mfrow=c(2, 2))

with(dsTarget, plot(DT, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(dsTarget, plot(DT, Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(dsTarget, plot(DT, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black"))
with(dsTarget, lines(DT, Sub_metering_2, type="l", col="red"))
with(dsTarget, lines(DT, Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"), text.font=1)

with(dsTarget, plot(DT, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()