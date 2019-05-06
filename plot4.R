# All plots are implemented with base R because of the remark in the instruction
# I just corrected the classes of the variables needed for the specific plot
# If you had to tidy the whole data frame, of course I would estimate all variable classes

# Creating Plot Nr. 4

library(data.table)
library(dplyr)
library(lubridate)
Sys.setlocale("LC_TIME", "English")

# Setting the working directory on your computer to the one that contains the file

# Reading the data
data <- fread("household_power_consumption.txt")

# Converting the Date Variable 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subsetting to the relevant two days
data <- filter(data, Date=="2007-02-01"|Date=="2007-02-02")

# Merging the Date and Time variable
data$datetime <- paste(data$Date, data$Time)
data$datetime <- ymd_hms(data$datetime)

# Converting the Voltage, Global_reactive_power, Global_active_power and the 3 
# Sub_metering variables into numeric variables
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Creating a four panel plot
par(mfrow=c(2,2))
plot(data$datetime, data$Global_active_power, xlab="", ylab="Global Active Power", 
     type="l")

plot(data$datetime, data$Voltage, xlab="datetime", ylab="Voltage", type="l")

plot(data$datetime, data$Sub_metering_1, type="l", col="black", xlab="", 
     ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, type="l", col="red")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.9, bty="n")

plot(data$datetime, data$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

# I was not sure about the font size, since there are small differences between the 
# pictures on the instruction page in coursera and the plots in the PNG files in the file 
# "figure". You could adjust them with 'cex.main', 'cex.axis' and 'cex.lab'.
# The size and position of the font in the legend box also depends on the size of your plot window.
# Furthermore you could adjust the font with parameters like y.intersp and x.intersp

# Creating the PNG file
dev.copy(png, file="plot4.png")
dev.off()
