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
hist(data$Global_active_power,col="RED", xlab="Global Active Power(kilowatts)", main="Global Active Power");
