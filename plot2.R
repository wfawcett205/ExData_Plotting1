## Create a new variable: DateTime by combining HPC_data2$Date and
## HPC_data2$Time.
## Convert with strptime()

dates<- HPC_data2$Date
time <- HPC_data2$Time
DateTime <- paste(dates, time)
DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

## Create a new data.table/data.frame by combining DateTime and HPC_data2
## Subset the new data.table to include only DateTime and Global_active_power.

plot2 <- cbind(DateTime, HPC_data2)
dim(plot2)
head(plot2)
plot2 <- plot2[,c(1,4)]

## Exploratory Data Analysis using default graphics device (results not shown)
## Set plot2

plot(plot2$DateTime, plot2$Global_active_power, type ="l", ylab = "Global Active Power 
     (kilowatts)", xlab = "")

## Open 2nd graphics device, upload plot, close 2nd graphics device

png(filename = "plot2.png", width = 480, height = 480)
plot(plot2$DateTime, plot2$Global_active_power, type ="l", ylab = "Global Active Power 
     (kilowatts)", xlab = "")
dev.off()