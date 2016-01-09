setwd("C:/Dokumenter/Dropbox/Coursera/Exploratory Data Analysis with R/Assignment 1")

data<-read.csv(file="household_power_consumption.txt",sep="\t")

data$Date<-as.Date(data$Date,"%d-%m-%Y")          
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))

hist(subset(data,Date=="2007-02-01" | Date=="2007-02-02")$Global_active_power,col="red",
            main="Global Active Power",xlab="Global Active Power (kilowatts)") #

dev.copy(png,file="plot1.png")
dev.off()

