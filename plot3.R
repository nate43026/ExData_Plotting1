source("Project1Lib.R")

fn_Plot3 <- function(x)
{
  fname <- "plot3.png"
  cat("Creating",fname, "\n")
  #
  par(mfrow=c(1,1))
  yrange<-range(c(hpc$Sub_metering_1,hpc$Sub_metering_2,hpc$Sub_metering_3))
  plot(hpc$DateTime, hpc$Sub_metering_1, type="l", xlab="", ylim=yrange, ylab="Energy sub metering")
  lines(hpc$DateTime,hpc$Sub_metering_2,  col="red")
  lines(hpc$DateTime,hpc$Sub_metering_3,  col="blue")
  legend("topright",cex=.8,lty=c(1,1,1),col=c("black","red","blue"),c("Sub_metering_1     ","Sub_metering_2     ","Sub_metering_3     "))
  #
  dev.copy(png,fname, width=480, height=480)
  dev.off() 
}

if (exists("hpc") && is.data.frame(get("hpc"))) { 
  fn_Plot3()
} else { 
  hpc <- fn_GetData() 
}