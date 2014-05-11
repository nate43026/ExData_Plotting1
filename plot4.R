source("Project1Lib.R")

fn_Plot4 <- function(x)
{
  fname <- "plot4.png"
  cat("Creating",fname, "\n")
  #
  attach(hpc)
  par(mfrow=c(2,2))
  plot(hpc$DateTime, hpc$Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(DateTime, Voltage, type="l", ylab="Voltage",xlab="datetime")
  #
  yrange<-range(c(hpc$Sub_metering_1,hpc$Sub_metering_2,hpc$Sub_metering_3))
  plot(hpc$DateTime, hpc$Sub_metering_1, type="l", xlab="", ylim=yrange, ylab="Energy sub metering")
  lines(hpc$DateTime,hpc$Sub_metering_2,  col="red")
  lines(hpc$DateTime,hpc$Sub_metering_3,  col="blue")
  legend("topright",bty="n",cex=.75,lty=c(1,1,1),col=c("black","red","blue"),c("Sub_metering_1   ","Sub_metering_2   ","Sub_metering_3   "))
  #
  plot(DateTime, Global_reactive_power, type="l", xlab="datetime")
  dev.copy(png,fname, width=480, height=480)
  dev.off()
}

if (exists("hpc") && is.data.frame(get("hpc"))) { 
  fn_Plot4()
} else { 
  hpc <- fn_GetData() 
}