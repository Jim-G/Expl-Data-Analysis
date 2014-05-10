required_package <- c("sqldf")
ifelse(is.element(required_package, installed.packages()[,1]),
       yes = library("sqldf"),
       no = print(paste("Please install the", required_package,  "package.")))


e_power_cons <- read.csv.sql("household_power_consumption.txt", 
                             sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'",
                             header = TRUE, sep = ";")

# Combine Date and Time into one field
e_power_cons$Date_Time <- paste(e_power_cons$Date, e_power_cons$Time)
#Format Date_Time as date-time data type
e_power_cons$Date_Time <- strptime(e_power_cons$Date_Time, format = "%m/%d/%Y %H:%M:%S")

png(filename = "plot3.png")

plot(e_power_cons$Date_Time, e_power_cons$Sub_metering_1, 
              type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(e_power_cons$Date_Time, e_power_cons$Sub_metering_2, col = "red")
lines(e_power_cons$Date_Time, e_power_cons$Sub_metering_3, col = "blue")
legend(x = "topright", lty = "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))

dev.off()