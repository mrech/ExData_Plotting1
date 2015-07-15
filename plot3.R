## Getting full dataset
full_hpc <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')

##It may be useful to convert the Date and Time variables to Date/Time classes 
#in R using the strptime() and as.Date() functions

full_hpc$Date <- as.Date(full_hpc$Date, format = "%d/%m/%Y")


##Subsetting the data
data <- subset (full_hpc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(full_hpc)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generating Plot 3

png(filename = "plot3.png", width = 480, height = 480)
with(data, {
    plot(Sub_metering_1 ~ Datetime, type = "l", 
    ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ Datetime, col = 'Red')
    lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

