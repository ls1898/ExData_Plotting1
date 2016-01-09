# read the data into variable
EPC <- read.table("household_power_consumption.txt", sep = ";",nrows=69518, na.strings = c("?"), header = TRUE)
# subset to only the relevant dates (based on glancing through the data)
EPC_dates <- EPC[66637:69516,]

# Create a new column with the right format of date
EPC_dates$TimeNew <- paste(as.Date(EPC_dates$Date, format="%d/%m/%Y"),EPC_dates$Time, sep = " ")
EPC_dates$TimeNew <- strptime(EPC_dates$TimeNew, format="%Y-%m-%d %H:%M:%S")

# Creating an empty plot and then adding the graph
plot(EPC_dates$TimeNew, EPC_dates$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(EPC_dates$TimeNew, EPC_dates$Global_active_power)

# Copying the created graph to a png file
dev.copy(png, file = "plot2.png")
dev.off()