#setting working directory
setwd("D:\\DataScience\\ExploratoryDataAnalysis");
#Read the whole data into a variable from the downloaded file 
content <- readLines("household_power_consumption.txt")
#Create a new file named feb.txt with the header text
cat("Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3", file="feb.txt", append=TRUE)
#Since we are going to use only data of two days extract them using grep command into the created file
cat(grep(pattern="^1/2/2007", content, value=TRUE), file="feb.txt", append=TRUE)
cat(grep(pattern="^2/2/2007", content, value=TRUE), file="feb.txt", append=TRUE)
#Read the created file's data into a variable
data <- read.table("feb.txt", sep = ";", header = T, na.strings = "?");
#Create a column named Datetime
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

# plot 1 (NW)
plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", 
    xlab = "")

# plot 2 (NE)
plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot 3 (SW)
plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
    xlab = "", col = "black")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
    col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
    col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"), bty = "n", )

# plot 4 (SE)
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", 
    ylab = "Global_reactive_power", ylim = c(0, 0.5), scale_y_continuous(breaks = c(0, 500)))


