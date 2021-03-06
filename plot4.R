# 2015-01-06 exploratory data analysis programming asignment 1

Sys.setlocale("LC_TIME", "English") # sets timezone correct
#read selection of the dataset into and header into Data
Data <- read.table("household_power_consumption.txt", skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2879, header=, sep=";", na.strings="?")
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
colnames( Data ) <- unlist(header)
# merge column with Date and Time into Data_Time (Date/Time classes) column and replace column in Data2. 
dates <- Data$Date
times <- Data$Time
x <- paste(dates, times, sep=";")# merges dates and times into one vector
Data_Time <- strptime(x, "%d/%m/%Y;%H:%M:%S")
Data2 <- Data[,c(3:9)]# removes old Date and Time columns
Data2$Data_Time <- Data_Time # asigns new Date and Time column

#generates plot4
png(filename="/plot4.png",width = 480, height = 480, bg = "transparent") #saves plot into png file
par(mfrow=c(2,2))# set dimensions
#plot4.1
plot(Data2$Data_Time, Data2$Global_active_power, type="l", ylab="Global Active Power", xlab="")
#plot4.2
plot(Data2$Data_Time, Data2$Voltage, type="l", ylab="Voltage", xlab="datetime")
#plot4.3
plot(Data2$Data_Time, Data2$Sub_metering_1, type="l", ylim = c(0, max(Data2$Sub_metering_1, Data2$Sub_metering_2, Data2$Sub_metering_3)), ylab="Energy sub metering", xlab="")
lines(Data2$Data_Time, Data2$Sub_metering_2, col = "red")
lines(Data2$Data_Time, Data2$Sub_metering_3, col = "blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1),
       col=c("black","red","blue"),
       bty = "n",
       cex=1)
#plot4.4
plot(Data2$Data_Time, Data2$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()