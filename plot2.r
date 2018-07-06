library(data.table)

data <- fread("./ExploratorayData/household_power_consumption.txt")

sdata<-subset(data, Date =='1/2/2007' | Date =='2/2/2007')

df<-as.data.frame(sdata)

df[, c(3:8)] <- apply(df[, c(3:8)], 2, function(x){as.numeric(x)})

df$DateTime <- paste(df$Date, df$Time, sep=" ")

df$DateTime<-strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

png(filename = "./ExploratorayData/plot2.png", width = 480, height = 480, units = "px")

plot(df$DateTime, df$Global_active_power, type="l", ylab="Global Active Power(kilowatts)", xlab=NA)

dev.off()


