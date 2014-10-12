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

## plot1 - histogram for Global Active Power
png(filename="plot1.png", width=480, height=480, units="px")
hist(dsTarget$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()