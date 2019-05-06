# All plots are implemented with base R because of the remark in the instruction
# I just corrected the classes of the variables needed for the specific plot
# If you had to tidy the whole data frame, of course I would estimate all variable classes

# Creating Plot Nr. 3

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

# Converting the 3 Sub_metering variables
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Creating the plot
plot(data$datetime, data$Sub_metering_1, type="l", col="black", main="", xlab="", 
     ylab="Energy sub metering", bg="transparent")
lines(data$datetime, data$Sub_metering_2, type="l", col="red")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.9)

# I was not sure about the font size, since there are small differences between the 
# pictures on the instruction page in coursera and the plots in the PNG files in the file 
# "figure". You could adjust them with 'cex.main', 'cex.axis' and 'cex.lab'.
# The size and position of the font in the legend box also depends on the size of your plot window.
# Furthermore you could adjust the font with parameters like y.intersp and x.intersp

# Creating the PNG file
dev.copy(png, file="plot3.png")
dev.off()
