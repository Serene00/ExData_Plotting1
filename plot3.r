library(data.table)

data <- fread("./ExploratorayData/household_power_consumption.txt")

sdata<-subset(data, Date =='1/2/2007' | Date =='2/2/2007')

df<-as.data.frame(sdata)

df[, c(3:8)] <- apply(df[, c(3:8)], 2, function(x){as.numeric(x)})

df$DateTime <- paste(df$Date, df$Time, sep=" ")

df$DateTime<-strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

png(filename = "./ExploratorayData/plot3.png", width = 480, height = 480, units = "px")

plot(df$DateTime, df$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=NA)

lines(df$DateTime, df$Sub_metering_2, col="red")

lines(df$DateTime, df$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

dev.off()