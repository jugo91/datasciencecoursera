# open a png device with target file and file format

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
# plot 2, bars Global active Power vs Frequency
with(household_power_consumption,plot(Datetime,Global_active_power, type="l",ylab = "Global Active Power (kilowatts)",xlab = ""))

# close the device  
dev.off()