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
##plot




Sys.setlocale("LC_TIME", "English")

png(filename = "plot3.png",
    width = 504, height = 504, units = "px", pointsize = 12,
    bg = "transparent", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

plot (x= pwr.filtered$DateTime, y= pwr.filtered$Sub_metering_1,type ="l",
      xlab ="",
      ylab = "Energy sub metering")
lines (x= pwr.filtered$DateTime, y= pwr.filtered$Sub_metering_2, col ="red")
lines (x= pwr.filtered$DateTime, y= pwr.filtered$Sub_metering_3, col ="blue")
legend("topright" ,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),        
       lty=c(1,1,1),
       bty="o", 
       lwd=c(2.5,2.5,2.5),
       col=c("black", "red", "blue"),
       inset=c(0,0),
       cex=0.8
)

dev.off()
