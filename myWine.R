myWine<-function(dens=NULL,totso2=NULL,rs=NULL,alc=NULL){
    suppressWarnings(suppressMessages(library(bigrf)))
    red_wine<-read.csv('winequality-red.csv',header=T,sep=';',colClasses=c('NULL','NULL','NULL','numeric','NULL','NULL','numeric','numeric','NULL','NULL','numeric','NULL'))
    white_wine<-read.csv('winequality-white.csv',header=T,sep=';',colClasses=c('NULL','NULL','NULL','numeric','NULL','NULL','numeric','numeric','NULL','NULL','numeric','NULL'))
    red_wine$type<-rep('Red',nrow(red_wine))
    white_wine$type<-rep('White',nrow(white_wine))
    wine<-rbind(red_wine,white_wine)
    wine$type<-as.factor(wine$type)
    set.seed(1)
    suppressWarnings(suppressMessages(fit<-bigrfc(wine, wine$type, ntrees = 20L, varselect = 1:4,trace=0)))
    df<-data.frame(residual.sugar=rs,total.sulfur.dioxide=totso2,density=dens,alcohol=alc)
    suppressWarnings(suppressMessages(pred<-predict(fit, df)))
    if(as.numeric(pred)==1){pred<-replace(pred, pred==1, "Red")}else{pred<-replace(pred, pred==2, "White")}
    as.character(pred)
}