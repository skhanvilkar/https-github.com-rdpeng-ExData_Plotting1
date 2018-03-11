##setwd("C:\Users\skhanvilkar")
if(!file.exists("./EDAQ1")){dir.create("./EDAQ1")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./EDAQ1/powerconsumption.zip")
unzip(zipfile="./EDAQ1/powerconsumption.zip",exdir="./EDAQ1")
path_rf <- file.path("./EDAQ1")
dataPowerConsumption <- read.table(file.path(path_rf, "household_power_consumption.txt"),skip=1,sep=";")
names(dataPowerConsumption)
head(dataPowerConsumption,10)
##View(dataPowerConsumtion)
names(dataPowerConsumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 	
subDataPower <- subset(dataPowerConsumption,dataPowerConsumption$Date=="1/2/2007" | dataPowerConsumption$Date =="2/2/2007")  
##View(subDataPower)
hist(as.numeric(as.character(subDataPower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
##rug(as.numeric(as.character(subDataPower$Global_active_power)))
dev.copy(png, file = "C:/Users/skhanvilkar/EDAQ1/plot1.png") 
dev.off()