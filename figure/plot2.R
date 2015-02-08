header<-read.table("household_power_consumption.txt",header=T,sep=";",nrows=5)

classes<-lapply(header,class)

dataset<-read.table("household_power_consumption.txt",header=T,sep=";",colClasses=classes,na.strings="?")

datasmall<-dataset[dataset$Date %in% c('1/2/2007', '2/2/2007'),]

datasmall$dateTime<-as.POSIXct(paste(datasmall$Date,datasmall$Time), format="%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)

with(datasmall, {
                  plot(dateTime, Global_active_power, type="n",xlab="",ylab="Global Active Power (kilowatts)")
                  lines(dateTime, Global_active_power)
                })

dev.off()
