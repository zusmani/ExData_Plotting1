# Exploratory Data Analysis Project #1 Plot #2

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
hpc$date<-as.Date(hpc$Date, format="%d/%m/%Y")
hpc$datetime<-paste(hpc$date, hpc$Time)
# create subset of dataset with only observations from Feb 1 and Feb 2, 2007
hpc1<-hpc[hpc$date=="2007-02-01" | hpc$date=="2007-02-02",]

# change coding of missing values from "?" to NA
sum(hpc1$Date=="?" | hpc1$Time=="?" | hpc1$Global_active_power=="?" | hpc1$Global_reactive_power=="?" | hpc1$Voltage=="?" | hpc1$Global_intensity=="?" | hpc1$Sub_metering_1=="?" | hpc1$Sub_metering_2=="?" | hpc1$Sub_metering_3=="?")
# 0 missing values in subset, so irrelevant


# Creating plot2.png
# Convert Global Active Power to numeric
hpc1$global_active_power<-as.numeric(levels(hpc1$Global_active_power))[hpc1$Global_active_power]

# Convert datetime to proper R-readable format
hpc1$datetime<-strptime(hpc1$datetime, format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
with(hpc1, plot(datetime,global_active_power, ylab = "Global Active Power (kilowatts) ", xlab="", type="l"))
dev.off()