library(data.table)

data <- fread("./ExploratorayData/household_power_consumption.txt")

sdata<-subset(data, Date =='1/2/2007' | Date =='2/2/2007')

df<-as.data.frame(sdata)

df[, c(3:8)] <- apply(df[, c(3:8)], 2, function(x){as.numeric(x)})

png(filename = "./ExploratorayData/plot1.png", width = 480, height = 480, units = "px")

hist(df$Global_active_power,col="red",xlab="Global Active Power(kilowatts)", main="Global Active Power" )

dev.off()

