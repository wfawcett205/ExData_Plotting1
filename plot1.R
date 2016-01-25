## Assign URL address from assignment
## Download the data and unzip

myURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myURL, "EPC.zip")
unzip("EPC.zip")

## Read in the data: "household_power_consumption.txt"
## Check that the dimensions of data agree with assignment
## Reset column names

HPC_data<-read.table("household_power_consumption.txt", sep = ";", skip = 1)
dim(HPC_data)
column_names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Subset data
## Perform 1st pass analysis using summary()

HPC_data2 <- subset(HPC_data, HPC_data$Date == "1/2/2007" | HPC_data$Date == "2/2/2007")
dim(HPC_data2)
HPC_data2$Global_active_power <- as.numeric(HPC_data2$Global_active_power)
summary(HPC_data2$Global_active_power)

## Exploratory Data Analysis using default graphics device (results not shown)
## Set plot1

HPC_data2$Global_active_power <- HPC_data2$Global_active_power/median(HPC_data2$Global_active_power)
hist(HPC_data2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Open 2nd graphics device, upload plot, close 2nd graphics device

png(filename = "plot1.png", width = 480, height = 480)
hist(HPC_data2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()