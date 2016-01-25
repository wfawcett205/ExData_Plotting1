plot3 <- cbind(DateTime, HPC_data2[,c(7:9)])
head(plot3)

## Exploratory Data Analysis using summary()

summary(plot3$Sub_metering_1)
summary(plot3$Sub_metering_2)
summary(plot3$Sub_metering_3)

plot(plot3$DateTime, plot3$Sub_metering_1, type = "l", xlab = "", ylab = 
       "Energy sub metering")
points(plot3$DateTime, plot3$Sub_metering_2, type = "l", col = "red")
points(plot3$DateTime, plot3$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_3", "Sub_metering_3"),
       lty= 1, lwd = 1, col =c("black", "red", "blue"))

## Open 2nd graphics device, upload plot, close 2nd graphics device

png(filename = "plot3.png", width = 480, height = 480)
plot(plot3$DateTime, plot3$Sub_metering_1, type = "l", xlab = "", ylab = 
       "Energy sub metering")
points(plot3$DateTime, plot3$Sub_metering_2, type = "l", col = "red")
points(plot3$DateTime, plot3$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_3", "Sub_metering_3"),
       lty= 1, lwd = 1, col =c("black", "red", "blue"))
dev.off()