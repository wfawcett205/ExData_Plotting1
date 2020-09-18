
# Assign URL address from assignment
# Download the data and unzip

myURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myURL, "EPC.zip")
unzip("EPC.zip")

# Read in the data: "household_power_consumption.txt"
# Subset the data

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
# Subset the new data.table to include only DateTime and Global_active_power.

plot2 <- cbind(DateTime, HPC_data2)
plot2 <- plot2[,c(1,4)]

# Exploratory Data Analysis using default graphics device (results not shown)
# Set plot2

plot(plot2$DateTime, plot2$Global_active_power, type ="l", 
      ylab = "Global Active Power (kilowatts)", xlab = "")

# Open 2nd graphics device, upload plot, close 2nd graphics device

png(filename = "plot2.png", width = 480, height = 480)
plot(plot2$DateTime, plot2$Global_active_power, type ="l", 
      ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
