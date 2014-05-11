source('utility.R')

plot1 <- function(){
    print('Running plot1')
    
    data <- getData()
    
    gap <- data$Global_active_power
    
    dir.create('out', showWarnings='F')
    
    png('out/plot1.png', width=480, height=480, bg='transparent')
    hist(gap, main="Global Active Power", xlab="Global Active Power (kilowatts)", col='red')
    dev.off()
}

plot1()
