## plot4.R
## This script creates a plot of 3 submetering accross 2 days. 

## Reading the csv file.
PlotData1 <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", dec=".",na.strings="?")

## Subsetting the data to extract records with ranges of February 1 2007 and February 2 2007.
PlotData1_Range <- PlotData1[PlotData1$Date %in% c("1/2/2007","2/2/2007"), ]

## Release the initial PlotData1 object to save memory.
PlotData1 <- NULL

## Concatenating the Date and Time Fields into a new DateTime field
PlotData1_Range$DateTime <- paste(PlotData1_Range$Date, PlotData1_Range$Time)

## Converting the DateTime field into POSIXlt format
PlotData1_Range$DateTime <- strptime(PlotData1_Range$DateTime, "%d/%m/%Y %H:%M:%S")

## setting up device
par(mfcol=c(2,2), cex.lab = 0.7, cex.axis = 0.7)

##plotting graphic 1
plot(PlotData1_Range$DateTime, PlotData1_Range$Global_active_power, type ="l", ylab="Global Active Power", xlab="")

##plotting graphic 2
## Plotting the graph and axis
with(PlotData1_Range, plot(DateTime, Sub_metering_1, type = "n", ylab="Energy sub metering", xlab=""))

## Plotting the graph sub metering 1
with(PlotData1_Range, lines(DateTime, Sub_metering_1, col="black"))

## Plotting the graph sub metering 2
with(PlotData1_Range, lines(DateTime, Sub_metering_2, col="red"))

## Plotting the graph sub metering 3
with(PlotData1_Range, lines(DateTime, Sub_metering_3, col="blue"))

## Creating legend
legend("topright", pch="", cex= 0.7, bty="n", lty = c(1, 1, 1), col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3" ))

##plotting graphic 3
plot(PlotData1_Range$DateTime, PlotData1_Range$Voltage, type ="l", ylab="Voltage", xlab="datetime")

##plotting graphic 4
plot(PlotData1_Range$DateTime, PlotData1_Range$Global_reactive_power, type ="l", ylab="Global_reactive_power", xlab="datetime")

## Saving the plot to a PNG graphic file.
dev.copy(png, file="plot4.png")

## closing the device
dev.off()