#This file does the initial setup, and runs the scripts for the plots.
#It ensures the necessary packages are installed, and downloads the source
#data into the project directory if not already present.

if(!require('sqldf')){
    install.packages('sqldf')
}
library(sqldf)

run_analysis <- function(){
    
    downloadData <- function(){
        fileName <- 'exdata-data-household_power_consumption.zip'
        
        if(!file.exists(fileName)){
            #download file. Try default method first. If that fails (e.g. for https and linux), try wget.
            tryCatch(
                download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile=fileName)
                , error = function(e){
                    download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile=fileName, method='wget')
                }
            )
        }
        
        fileName
    }
    
    downloadData()
    source('plot1.R')
}

run_analysis()
