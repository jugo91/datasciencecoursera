# open a png device with target file and file format

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
# plot 1, bars Global active Power vs Frequency
with(household_power_consumption,plot(Datetime,Sub_metering_1, type="l",ylab = "Energy sub metering",xlab = ""))
with(household_power_consumption,points(Datetime,Sub_metering_2,type="l",col="red"))
with(household_power_consumption,points(Datetime,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
# close the device  
dev.off()