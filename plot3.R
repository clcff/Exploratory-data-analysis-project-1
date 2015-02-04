plot3 <- function(){
  
  data <- read.table("household_power_consumption.txt", sep=";", header = T, na.strings ="?")
  
  subdata <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))
  
  newtime <- strptime( paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  
  
  png("plot3.png", width = 480, height = 480)
  
  x <- newtime
  
  y <- subdata$Sub_metering_1
  
  plot(x, y, type ="n", ylab = "Energy sub metering")
  
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"), lty=1, lwd=2, col = c("black", "red", "blue"))
  
  points(x, y, col = "black", type = "l")
  
  y <- subdata$Sub_metering_2
  
  points(x, y, col = "red", type = "l")
  
  y <- subdata$Sub_metering_3
  
  points(x, y, col = "blue", type = "l")
  
  dev.off()
}
