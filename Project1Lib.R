#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#One alternative is to read the data from just those dates rather than 
#reading in the entire dataset and subsetting to those dates.

#You may find it useful to convert the Date and Time variables to 
#Date/Time classes in R using the strptime() and as.Date() functions.

#Note that in this dataset missing values are coded as ?.


fn_GetData <- function(){
  fn_PkgTest("sqldf")
  library(sqldf)
  cat("The current working directory is", getwd(),"\n")
  file = "household_power_consumption.txt"
  if (!file.exists(file))
  {
    cat("Data file not found.","\n")
  }
  mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  hpc <- read.csv.sql(file,sql=mySql,sep=";")
  
  hpc$DateTime <- paste(hpc$Date, hpc$Time)
  hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")
  hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  
  return(hpc)
}


# Checks for required packages
fn_PkgTest <- function(x)
{
  if (!require(x,character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
    if(!require(x,character.only = TRUE)) stop("Package not found")
  }
}



