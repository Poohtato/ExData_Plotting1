# All plots are implemented with base R because of the remark in the instruction
# I just corrected the classes of the variables needed for the specific plot
# If you had to tidy the whole data frame, of course I would estimate all variable classes

# Creating Plot Nr. 1

library(data.table)
library(dplyr)

# Setting the working directory on your computer to the one that contains the file

# Reading the data
data <- fread("household_power_consumption.txt")

# Converting the Date Variable
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subsetting to the relevant two days
data <- filter(data, Date=="2007-02-01"|Date=="2007-02-02")

# Converting the Global Active Power variable
data$Global_active_power <- as.numeric(data$Global_active_power)

# Constructing the plot
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
          ylab="Frequency", col="red")

# I was not sure about the font size, since there are small differences between the 
# pictures on the instruction page in coursera and the plots in the PNG files in the file 
# "figure". You could adjust them with 'cex.main', 'cex.axis' and 'cex.lab'.
               
# Creating the PNG file
dev.copy(png, file="plot1.png")
dev.off()
