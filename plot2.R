required_package <- c("sqldf1")
ifelse(is.element(required_package, installed.packages()[,1]),
       yes = library("sqldf"),
       no = print(paste("Please install the", required_package,  "package.")))

e_power_cons <- read.csv.sql("household_power_consumption.txt", 
                             sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'",
                             header = TRUE, sep = ";")

# Combine Date and Time into one field
e_power_cons$Date_Time <- paste(e_power_cons$Date, e_power_cons$Time)
#Format Date_Time as date-time data type
e_power_cons$Date_Time <- strptime(e_power_cons$Date_Time, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png")

plot(e_power_cons$Date_Time, e_power_cons$Global_active_power, 
   type = "l", ylab = "Global Active Power (kilowatts)", 
   xlab = "")

dev.off()