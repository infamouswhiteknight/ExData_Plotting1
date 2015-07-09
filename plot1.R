## Read in the data to a dataframe, create a new dataframe for the dates of interest, and grab the global active power column as a vector
## Note: This is obviously inefficient, but it's also very easy, and with an abundance of computer power, this felt like a "clean" solution
data <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses="character",na.strings="?")
dataLess <- data[data["Date"]=="1/2/2007"|data["Date"]=="2/2/2007",]
GAP <- as.numeric(dataLess$Global_active_power)

## Open the png graphics device, plot the histogram, close the device
png(filename="plot1.png")
hist(GAP,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.off()