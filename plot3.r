setwd("C:/Dokumenter/Dropbox/Coursera/Exploratory Data Analysis with R/Assignment 1")
data<-read.csv(file="household_power_consumption.txt",sep="\t",stringsAsFactors=FALSE, dec=".")

data$Date<-as.Date(data$Date,"%d-%m-%Y")          
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

idx<-with(data,Date=="2007-02-01" | Date=="2007-02-02")

with(data,{
  png("plot3.png", width=480, height=480)
  plot(datetime[idx], Sub_metering_1[idx], type="l", ylab="Energy Submetering", xlab="")
  lines(datetime[idx], Sub_metering_2[idx], type="l", col="red")
  lines(datetime[idx], Sub_metering_3[idx], type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  dev.off()
})
