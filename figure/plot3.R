header<-read.table("household_power_consumption.txt",header=T,sep=";",nrows=5)

classes<-lapply(header,class)

dataset<-read.table("household_power_consumption.txt",header=T,sep=";",colClasses=classes,na.strings="?")

datasmall<-dataset[dataset$Date %in% c('1/2/2007', '2/2/2007'),]

datasmall$dateTime<-as.POSIXct(paste(datasmall$Date,datasmall$Time), format="%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)

with(datasmall, {
  plot(dateTime, Sub_metering_1, type="n",xlab="",ylab="Energy sub metering")
  lines(dateTime, Sub_metering_1)
  lines(dateTime, Sub_metering_2,col = "red")
  lines(dateTime, Sub_metering_3, col = "blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
  })

dev.off()