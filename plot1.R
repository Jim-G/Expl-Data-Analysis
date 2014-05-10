required_package <- c("sqldf")
ifelse(is.element(required_package, installed.packages()[,1]),
    yes = library("sqldf"),
    no = print(paste("Please install the", required_package,  "package.")))

e_power_cons <- read.csv.sql("household_power_consumption.txt", 
      sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'",
      header = TRUE, sep = ";")

png(filename = "plot1.png")

hist(e_power_cons$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200))

dev.off()