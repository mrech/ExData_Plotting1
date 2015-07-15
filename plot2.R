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

## Generating Plot 2
#type: indicates what type of plot should be drawn. Possible types are:
#'l' for lines.

png(filename = "plot2.png", width = 480, height = 480)
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()