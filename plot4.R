
# Assign URL address from assignment
# Download the data and unzip

myURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myURL, "EPC.zip")
unzip("EPC.zip")

# Read in the data: "household_power_consumption.txt"
# Subset data

HPC_data<-read.delim("household_power_consumption.txt", header=TRUE, sep = ";")
HPC_data2 <- subset(HPC_data, HPC_data$Date == "1/2/2007" | HPC_data$Date == "2/2/2007")

# Create a new variable: DateTime by combining HPC_data2$Date and
# HPC_data2$Time.
# Convert with strptime()

date <- HPC_data2$Date
time <- HPC_data2$Time
DateTime <- paste(date, time)
DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

# Create a new data.table/data.frame by combining DateTime and HPC_data2

plot2 <- cbind(DateTime, HPC_data2)
plot2 <- plot2[,c(1,4)]

HPC_data2[, 7:9] <- type.convert(HPC_data2[, 7:9])
plot3 <- cbind(DateTime, HPC_data2[, 7:9])

par(mfcol=c(2,2), mar = c(4,4,2,2))
plot(plot2$DateTime, plot2$Global_active_power, type ="l", 
        ylab = "Global Active Power (kilowatts)", xlab = "")

plot(plot3$DateTime, plot3$Sub_metering_1, type = "l", xlab = "",  
        ylab = "Energy sub metering")
points(plot3$DateTime, plot3$Sub_metering_2, type = "l", col = "red")
points(plot3$DateTime, plot3$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_3", "Sub_metering_3"),
       lty= 1, lwd = 1, col =c("black", "red", "blue"))

plot4 <- cbind(DateTime, HPC_data2)
plot(plot4$DateTime, plot4$Voltage, type ="l", xlab ="datetime", ylab="Voltage")
plot(plot4$DateTime, plot4$Global_reactive_power, type ="l", xlab ="datetime", 
     ylab="Global_reactive_power" )

# Open 2nd graphics device, upload plot, close 2nd graphics device

png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2), mar = c(4,4,2,2))
plot(plot2$DateTime, plot2$Global_active_power, type ="l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

plot(plot3$DateTime, plot3$Sub_metering_1, type = "l", xlab = "", ylab = 
       "Energy sub metering")
points(plot3$DateTime, plot3$Sub_metering_2, type = "l", col = "red")
points(plot3$DateTime, plot3$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_3", "Sub_metering_3"),
       lty= 1, lwd = 1, col =c("black", "red", "blue"))

plot4 <- cbind(DateTime, HPC_data2)
plot(plot4$DateTime, plot4$Voltage, type ="l", xlab ="datetime", ylab="Voltage")
plot(plot4$DateTime, plot4$Global_reactive_power, type ="l", xlab ="datetime", 
     ylab="Global_reactive_power" )
dev.off()