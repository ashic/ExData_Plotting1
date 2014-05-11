source('utility.R')

plot3 <- function(){
    print('Running plot2')
    
    data <- getData()
    
    dateTime <- paste(data$Date, data$Time, sep=' ')
    dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
    
    dir.create('out', showWarnings='F')
    
    png('out/plot3.png', width=480, height=480, bg='transparent')
    plot(dateTime, data$Sub_metering_1, type='l', xlab='', ylab="Energy sub metering")
    lines(dateTime, data$Sub_metering_2, type='l', col='red')
    lines(dateTime, data$Sub_metering_3, type='l', col='blue')
    
    legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd='1', col=c('black', 'red', 'blue'))
    dev.off()
}

plot3()
