setwd("C:/Dokumenter/Dropbox/Coursera/Exploratory Data Analysis with R/Assignment 1")
data<-read.csv(file="household_power_consumption.txt",sep="\t")

data$Date<-as.Date(data$Date,"%d-%m-%Y")          
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

idx<-with(data,Date=="2007-02-01" | Date=="2007-02-02")

with(data, {
  png("plot2.png", width=480, height=480)
  plot(datetime[idx],Global_active_power[idx],type="l",ylab="Global active power (kilowatts",xlab="")
})
