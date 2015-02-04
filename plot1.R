plot1 <- function(){
      
  #setwd("C:/Users/Cla/Documents/exdata-data-household_power_consumption")
  
  data <- read.table("household_power_consumption.txt", sep=";", header = T, na.strings ="?")
  
  subdata <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))
   
  png("plot1.png", width = 480, height = 480)
  
  hist(subdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  
  dev.off()
  }
