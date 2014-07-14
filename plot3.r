#setting working directory
#setwd("D:\\DataScience\\ExploratoryDataAnalysis");
setwd("F:\\Learning\\Data Science\\data\\GitProject")
#Read the whole data into a variable from the downloaded file 
content <- readLines("household_power_consumption.txt")
#Create a new file named feb.txt with the header text
cat("Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3", file="feb1.txt", append=TRUE)
#Since we are going to use only data of two days extract them using grep command into the created file
cat("\n", file="feb1.txt", append=TRUE)
cat(grep(pattern="^1/2/2007", content, value=TRUE), file="feb1.txt", append=TRUE,sep="\n")
cat("\n", file="feb1.txt", append=TRUE)
cat(grep(pattern="^2/2/2007", content, value=TRUE), file="feb1.txt", append=TRUE,sep="\n")
#Read the created file's data into a variable
data <- read.table("feb1.txt", sep = ";", header = T, na.strings = "?");
#Create a column named Datetime
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
    col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
    col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"))
