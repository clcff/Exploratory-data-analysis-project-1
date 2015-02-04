plot2 <- function(){
  
  data <- read.table("household_power_consumption.txt", sep=";", header = T, na.strings ="?")
  
  subdata <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))
  
  newtime <- strptime( paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  png("plot2.png", width = 480, height = 480)
  
  x <- newtime
  
  y <- subdata$Global_active_power
  
  plot(x, y, ylab = "Global Active Power (Kilowatts)", type ="l")
  
  dev.off()
}
