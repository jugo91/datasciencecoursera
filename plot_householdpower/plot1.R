# open a png device with target file and file format

  png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
# plot 1, bars Global active Power vs Frequency
  with(household_power_consumption,hist(Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)",main="Global Active Power"))

# close the device  
  dev.off()