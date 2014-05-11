source("Project1Lib.R")


fn_Plot2 <- function(x)
{
  fname <- "plot2.png"
  cat("Creating",fname, "\n")
  #
  par(mfrow=c(1,1))
  plot(hpc$DateTime, hpc$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  #
  dev.copy(png,fname, width=480, height=480)
  dev.off()
}

if (exists("hpc") && is.data.frame(get("hpc"))) { 
  fn_Plot2()
} else { 
  hpc <- fn_GetData() 
}