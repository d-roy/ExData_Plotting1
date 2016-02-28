file <- "household_power_consumption.txt"
dfrm <- read.table(file, header=TRUE, sep=";")

dfrm$Date <- as.Date(dfrm$Date, format="%d/%m/%Y")
epc <- dfrm[(dfrm$Date=="2007-02-01") | (dfrm$Date=="2007-02-02"),]

epc$Global_active_power <- as.numeric(as.character(epc$Global_active_power))
epc$Global_reactive_power <- as.numeric(as.character(epc$Global_reactive_power))
epc$Voltage <- as.numeric(as.character(epc$Voltage))
epc <- transform(epc, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
epc$Sub_metering_1 <- as.numeric(as.character(epc$Sub_metering_1))
epc$Sub_metering_2 <- as.numeric(as.character(epc$Sub_metering_2))
epc$Sub_metering_3 <- as.numeric(as.character(epc$Sub_metering_3))

hist(epc$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
