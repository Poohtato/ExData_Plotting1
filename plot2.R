# All plots are implemented with base R because of the remark in the instruction
# I just corrected the classes of the variables needed for the specific plot
# If you had to tidy the whole data frame, of course I would estimate all variable classes

# Creating Plot Nr. 2

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

# Converting the Global Active Power variable
data$Global_active_power <- as.numeric(data$Global_active_power)

# Constructing the plot
plot(data$datetime, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", 
     type="l")

# I was not sure about the font size, since there are small differences between the 
# pictures on the instruction page in coursera and the plots in the PNG files in the file 
# "figure". You could adjust them with 'cex.main', 'cex.axis' and 'cex.lab'.

# Creating the PNG file
dev.copy(png, file="plot2.png")
dev.off()
