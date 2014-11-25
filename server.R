myWine<-function(dens=NULL,totso2=NULL,rs=NULL,alc=NULL0){
    suppressWarnings(suppressMessages(library(bigrf)))
    #setwd('/Volumes/Documentos importantes/Coursera/9 - Developing Data Products/Quizzes and Project/Wine Quality')
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


library(shiny)
shinyServer(
    function(input, output) {
        output$dens<-renderPrint({input$dens})
        output$totso2<-renderPrint({input$totso2})
        output$rs<-renderPrint({input$rs})
        output$alc<-renderPrint({input$alc})
        output$predic<-renderText({input$goButton
                                   isolate(myWine(dens=input$dens,totso2=input$totso2,rs=input$rs,alc=input$alc))})
        
    }
)