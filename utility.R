if(!require('sqldf')){
    install.packages('sqldf')
}
library(sqldf)

loadData <- function(){    
    downloadData <- function(url, zipFile){    
        if(!file.exists(zipFile)){
            #download file. Try default method first. If that fails (e.g. for https and linux), try wget.
            tryCatch(
                download.file(url, destfile=zipFile)
                , error = function(e){
                    download.file(url, destfile=zipFile, method='wget')
                }
            )
        }
    }
    
    extractFile <- function(file, zipFile) {
        if(!file.exists(file)) {
            unzip(zipFile, files=file)
        }
    }
    
    prepareData <- function(){
        url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
        targetFile <- 'household_power_consumption.txt'
        zipFile <- 'exdata-data-household_power_consumption.zip'
        
        downloadData(url, zipFile)
        extractFile(targetFile, zipFile)
        
        cols <- c("character", "character", rep("numeric", 7))
        
        
        sql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
        
        d <- read.csv.sql(targetFile, sql, sep=';'
                          #, na.strings='?'
                          ,colClasses=cols
                          ,header=T)
        d <- d[d$Date == '1/2/2007' | d$Date == '2/2/2007', ] 
        
        d
    }
    
    prepareData()
}

getData <- function(){
    if(!exists('loadedData')){
        loadedData <<- loadData()
    }
    
    loadedData
}
