# Set working directory 
setwd("~/Documents/Coursera/Exploratory_Data_Analysis/Project_1/ExData_Plotting1/")

# Load the data file - full data set is ok with memory on this machine. 
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Subset the data to the date range(s) we want. 
data.subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Combine date and time into one column and cast it to a date/time class
data.subset$DateTime <- strptime(paste(data.subset$Date, data.subset$Time), format="%d/%m/%Y %H:%M:%S")

# Open graphics device so we can write the plot to a file
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

# Generate Plot. Set the title using main, x labels, y labels and the color. 
plot(x=data.subset$DateTime, y=data.subset[,"Sub_metering_1"], type="l",ylab="Energy sub metering", main="", xlab="")
lines(x=data.subset$DateTime,, y=data.subset[,"Sub_metering_2"], col="red")
lines(x=data.subset$DateTime,, y=data.subset[,"Sub_metering_3"], col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close Graphics Device
dev.off()