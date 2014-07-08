# Exploratory Dat Analysis Project #1 Plot #3

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
hpc$date<-as.Date(hpc$Date, format="%d/%m/%Y")
hpc$datetime<-paste(hpc$date, hpc$Time)
# create subset of dataset with only observations from Feb 1 and Feb 2, 2007
hpc1<-hpc[hpc$date=="2007-02-01" | hpc$date=="2007-02-02",]

# change coding of missing values from "?" to NA
sum(hpc1$Date=="?" | hpc1$Time=="?" | hpc1$Global_active_power=="?" | hpc1$Global_reactive_power=="?" | hpc1$Voltage=="?" | hpc1$Global_intensity=="?" | hpc1$Sub_metering_1=="?" | hpc1$Sub_metering_2=="?" | hpc1$Sub_metering_3=="?")
# 0 missing values in subset, so irrelevant


# Creating plot3.png

# Convert datetime to proper R-readable format
hpc1$datetime<-strptime(hpc1$datetime, format="%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
plot(hpc1$datetime, hpc1$Sub_metering_1, type="l", yaxp=c(0,30,3), ylab="Energy sub metering", xlab="")
points(hpc1$datetime, hpc1$Sub_metering_2, type="l", col="red")
points(hpc1$datetime, hpc1$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3 "))
dev.off()