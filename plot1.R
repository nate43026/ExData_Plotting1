source("Project1Lib.R")

fn_Plot1 <- function(x)
{
  fname <- "plot1.png"
  cat("Creating",fname, "\n")
  #
  par(mfrow=c(1,1))
  hist(hpc$Global_active_power, col="red", main="Global Active Power",xlab="Global active power (kilowatts)")
  #
  dev.copy(png,fname, width=480, height=480)
  dev.off()
}

if (exists("hpc") && is.data.frame(get("hpc"))) { 
  fn_Plot1()
} else { 
  hpc <- fn_GetData() 
}