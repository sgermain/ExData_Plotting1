## plot1.R
## This script creates a histogram of Global active power consumption accross 2 days. 

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

## Plotting the histogram
hist(PlotData1_Range$Global_active_power, freq = TRUE, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Setting up format of png
## png("TEST.png", width = 480, height = 480, units = "px")

## Saving the plot to a PNG graphic file.
dev.copy(png, file="plot1.png")

## closing the device
dev.off()
