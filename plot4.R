# read the data into variable
EPC <- read.table("household_power_consumption.txt", sep = ";",nrows=69518, na.strings = c("?"), header = TRUE)
# subset to only the relevant dates (based on glancing through the data)
EPC_dates <- EPC[66637:69516,]

# Create a new column with the right format of date
EPC_dates$TimeNew <- paste(as.Date(EPC_dates$Date, format="%d/%m/%Y"),EPC_dates$Time, sep = " ")
EPC_dates$TimeNew <- strptime(EPC_dates$TimeNew, format="%Y-%m-%d %H:%M:%S")

# Open PNG device; create plot4.png in my working directory
png(file = "plot4.png")
par(mfcol = c(2,2))
with (EPC_dates, {
  plot(TimeNew, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
  lines(TimeNew, Global_active_power)
  plot(TimeNew, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
  lines(TimeNew, Sub_metering_1)
  lines(TimeNew, Sub_metering_2, col="red")
  lines(TimeNew, Sub_metering_3, col="blue")
  plot(TimeNew, Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
  lines(TimeNew, Voltage)
  plot(TimeNew, Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
  lines(TimeNew, Global_reactive_power)
  })

dev.off()