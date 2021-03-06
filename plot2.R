new_dir <- "C:/Users/khozeev/Documents/RStudio/Projects/ExData_Plotting1/ExData_Plotting1"
setwd(new_dir)

## Read data
pwr.filename <- "household_power_consumption.txt"
pwr.data <- read.csv(pwr.filename,sep=";",na.strings = "?")

## Insert datetime

pwr.data$DateTime <- strptime(paste(pwr.data$Date,pwr.data$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

## Interval

startDate <- as.Date("2007-02-01 00:00:00")
finishDate <- as.Date("2007-02-02 23:59:59")

pwr.filtered <- pwr.data[as.Date(pwr.data$DateTime) >= as.Date(startDate) 
                         & as.Date(pwr.data$DateTime) <= as.Date(finishDate),]

## plot

Sys.setlocale("LC_TIME", "English")

png(filename = "plot2.png",
    width = 504, height = 504, units = "px", pointsize = 12,
    bg = "transparent", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

with(pwr.filtered
     , plot(DateTime, Global_active_power
            , type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.off()