plot4 <- function(){
  
  data <- read.table("household_power_consumption.txt", sep=";", header = T, na.strings ="?")
  subdata <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))
  newtime <- strptime( paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
     
  png("plot4.png", width = 480, height = 480)
  
  par(mfrow = c(2,2))
  
  x <- newtime
  
  y <- subdata$Global_active_power
  plot(x, y, ylab = "Global Active Power", type ="l")
  
  y <- subdata$Voltage
  plot(x, y, type ="l", xlab="datetime", ylab="Voltage")
    
  y <- subdata$Sub_metering_1
  plot(x, y, type ="l", ylab = "Energy sub metering", col="black")
  y <- subdata$Sub_metering_2
  lines(x, y, col = "red")
  y <- subdata$Sub_metering_3
  lines(x, y, col = "blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"), lty=1 ,lwd=2, col = c("black", "red", "blue"))
  
  y <- subdata$Global_reactive_power
  plot(x, y, type ="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
}
