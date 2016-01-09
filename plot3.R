# read the data into variable
EPC <- read.table("household_power_consumption.txt", sep = ";",nrows=69518, na.strings = c("?"), header = TRUE)
# subset to only the relevant dates (based on glancing through the data)
EPC_dates <- EPC[66637:69516,]

# Create a new column with the right format of date
EPC_dates$TimeNew <- paste(as.Date(EPC_dates$Date, format="%d/%m/%Y"),EPC_dates$Time, sep = " ")
EPC_dates$TimeNew <- strptime(EPC_dates$TimeNew, format="%Y-%m-%d %H:%M:%S")

# Open PNG device; create plot3.png in my working directory
png(file = "plot3.png")

# Creating an empty plot and then adding the graph and legend
plot(EPC_dates$TimeNew, EPC_dates$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(EPC_dates$TimeNew, EPC_dates$Sub_metering_1)
lines(EPC_dates$TimeNew, EPC_dates$Sub_metering_2, col="red")
lines(EPC_dates$TimeNew, EPC_dates$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Closing the PNG device
dev.off()