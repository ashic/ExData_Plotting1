source('utility.R')

plot2 <- function(){
    print('Running plot2')
    
    data <- getData()
    
    gap <- data$Global_active_power
    dateTime <- paste(data$Date, data$Time, sep=' ')
    dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
    
    dir.create('out', showWarnings='F')
    
    png('out/plot2.png', width=480, height=480, bg='transparent')
    plot(dateTime, gap, type='l', xlab='', ylab="Global Active Power (kilowatts)")
    dev.off()
}

plot2()
