# Set working directory 
setwd("~/Documents/Coursera/Exploratory_Data_Analysis/Project_1/ExData_Plotting1/")

# Load the data file - full data set is ok with memory on this machine. 
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert dates to a date format. 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data to the date range(s) we want. 
data.subset <- subset(data, (Date == "2007-01-02") | (Date == "2007-02-02"))

# Combine date and time into one column and cast it to a date/time class
data.subset$DateTime <- as.POSIXct(paste(data.subset$Date, data.subset$Time))

# Open graphics device so we can write the plot to a file
png(filename = "plot1.png", width = 480, height = 480, units = "px", 
    bg = "transparent")

# Generate Plot. Set the title using main, x labels, y labels and the color. 
hist(data.subset$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red",
     ylim = c(0,1200), breaks = 12)

# Close Graphics Device
dev.off()
