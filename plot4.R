## Readaing the text file ##
dt_full<-as.data.frame(read.table("household_power_consumption.txt", header=T, 
                       sep=';', na.strings="?", comment.char="", quote='\"'))

## Formatting the Date-variable ##
dt_full$Date<-as.Date(dt_full$Date, format="%d/%m/%Y")

## Extracting the required data ##
dt_assn1 <- subset(dt_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting Date-time ##
datetime <- paste(as.Date(dt_assn1$Date), dt_assn1$Time)
dt_assn1$Datetime <- as.POSIXct(datetime)

## Making plot 4 ##
x11()
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dt_assn1, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving plot 4 as a .png file ##
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


