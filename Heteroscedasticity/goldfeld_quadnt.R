
consmp_o<-consmp[order(consmp$income),]

part1<-consmp_o[1:8,]
part3<-consmp_o[13:20,]
fit_n1<-lm(expen~income,part1)
fit_n2<-lm(expen~income,part3)