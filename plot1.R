## Redaing the text file ##
dt_full<-as.data.frame(read.table("household_power_consumption.txt", header=T, 
                       sep=';', na.strings="?", comment.char="", quote='\"'))

## Formatting the Date-variable ##
dt_full$Date<-as.Date(dt_full$Date, format="%d/%m/%Y")


## Extracting the required data ##
dt_plot1 <- subset(dt_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Saving the assignment data in the working irectory ##
write.csv(dt_plot1, "dt_assn1.csv")

## Making the histogram ##
hist(dt_plot1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving the histogram as a .png file ##
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
