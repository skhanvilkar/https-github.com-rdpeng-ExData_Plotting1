dataPowerConsumption <- read.table(file.path(path_rf, "household_power_consumption.txt"),skip=1,sep=";")
names(dataPowerConsumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 	
subDataPower <- subset(dataPowerConsumption,dataPowerConsumption$Date=="1/2/2007" | dataPowerConsumption$Date =="2/2/2007")  
# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subDataPower$Date <- as.Date(subDataPower$Date, format="%d/%m/%Y")
subDataPower$Time <- strptime(subDataPower$Time, format="%H:%M:%S")
subDataPower[1:1440,"Time"] <- format(subDataPower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subDataPower[1441:2880,"Time"] <- format(subDataPower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# initiating a composite plot with many graphs
par(mfrow=c(2,2))
# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(subDataPower,{
        plot(subDataPower$Time,as.numeric(as.character(subDataPower$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
        plot(subDataPower$Time,as.numeric(as.character(subDataPower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
        plot(subDataPower$Time,subDataPower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        with(subDataPower,lines(Time,as.numeric(as.character(Sub_metering_1))))
        with(subDataPower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
        with(subDataPower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
        legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
        plot(subDataPower$Time,as.numeric(as.character(subDataPower$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.copy(png, file = "C:/Users/skhanvilkar/EDAQ1/plot4.png") 
dev.off()