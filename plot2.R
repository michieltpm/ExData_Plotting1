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

#generates plot2
png(filename="/plot2.png",width = 480, height = 480, bg = "transparent") #saves plot into png file
plot(Data2$Data_Time, Data2$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="",
     cex.lab = 0.9,cex.axis = 1)
dev.off()