
# Assign URL address from assignment
# Download the data and unzip

myURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myURL, "EPC.zip")
unzip("EPC.zip")

# Read in the data: "household_power_consumption.txt"
# Check that the dimensions of data agree with assignment
# Subset data and confirm dimensions

HPC_data<-read.delim("household_power_consumption.txt", header=TRUE, sep = ";")
dim(HPC_data)
HPC_data2 <- subset(HPC_data, HPC_data$Date == "1/2/2007" | HPC_data$Date == "2/2/2007")
dim(HPC_data2)

HPC <- HPC_data2
HPC[, 3:9] <- type.convert(HPC[, 3:9])

# Exploratory Data Analysis using default graphics device (results not shown)
# Set plot1

hist(HPC$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# Open 2nd graphics device, upload plot, close 2nd graphics device

png(filename = "plot1.png", width = 480, height = 480)
hist(HPC$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()