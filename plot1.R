# read the data into variable
EPC <- read.table("household_power_consumption.txt", sep = ";",nrows=69518, na.strings = c("?"), header = TRUE)
# subset to only the relevant dates (based on glancing through the data)
EPC_dates <- EPC[66637:69516,]
# Create the histogram with titles and red color
hist(EPC_dates$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col="red")
# Copy file to PNG and save file
dev.copy(png, file = "plot1.png")
dev.off()