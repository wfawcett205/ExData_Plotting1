par(mfcol=c(2,2), mar = c(4,4,2,2))
plot(plot2$DateTime, plot2$Global_active_power, type ="l", ylab = "Global Active Power 
     (kilowatts)", xlab = "")
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
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2), mar = c(4,4,2,2))
plot(plot2$DateTime, plot2$Global_active_power, type ="l", ylab = "Global Active Power 
     (kilowatts)", xlab = "")
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