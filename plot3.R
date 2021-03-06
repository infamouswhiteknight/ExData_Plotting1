## Read in the data to a dataframe, create a new dataframe for the dates of interest, and grab the sub-metering columns as vectors
## Note: This is obviously inefficient, but it's also very easy, and with an abundance of computer power, this felt like a "clean" solution
data <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses="character",na.strings="?")
dataLess <- data[data["Date"]=="1/2/2007"|data["Date"]=="2/2/2007",]
SM1 <- as.numeric(dataLess$Sub_metering_1)
SM2 <- as.numeric(dataLess$Sub_metering_2)
SM3 <- as.numeric(dataLess$Sub_metering_3)

## Create a date-time vector (POSIXlt format)
dateTime <- as.POSIXlt(paste(as.Date(dataLess$Date,  format="%d/%m/%Y"), dataLess$Time))


## Open the png graphics device, create an empty plot with the right axes
png(filename="plot3.png")
plot(dateTime,SM1,type="n",xlab="",ylab="Energy sub metering")

## Add the 3 sets of lines for the plot
lines(dateTime,SM1,col="black")
lines(dateTime,SM3,col="blue")
lines(dateTime,SM2,col="red")

## Add the legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

## Close the graphics device
dev.off()