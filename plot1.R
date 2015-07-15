##function to create, open and close connections
txtfile <- file ("household_power_consumption.txt")  

##We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#One alternative is to read the data from just those dates rather than
#reading in the entire dataset and subsetting to those dates.

#grep: pattern matching and replacement

hpc <- read.table(text= grep("^[1,2]/2/2007", readLines(txtfile), value=TRUE),
col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
"Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
sep = ";", header = TRUE)

#Generating Plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(hpc$Global_active_power, col="red", main=paste("Global Active Power"), 
xlab = "Global Active Power (kilowatts)")
dev.off()