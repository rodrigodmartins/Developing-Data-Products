library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Evaluating typical properties of wines"),
    sidebarPanel(
        h3('Chemical characteristics'),
        sliderInput('dens','Density, g/mL',0.995,min=0.985,max=1.005,step=0.001),
        sliderInput('totso2','Total sulfur dioxide, mg/L',120,min=10,max=250,step=10),
        sliderInput('rs','Residual sugar, g/L',3,min=1,max=20,step=1),
        sliderInput('alc','Alcoholic content, %',10,min=8,max=14,step=1),
        actionButton('goButton','Submit')
    ),
    mainPanel(
        h3('Your choices are'),
        h4('Wine density, in g/mL'),verbatimTextOutput('dens'),
        h4('Wine total sulfur dioxide, in mg/L'),verbatimTextOutput('totso2'),
        h4('Wine residual sugar, in g/L'),verbatimTextOutput('rs'),
        h4('Wine alcoholic content, in %'),verbatimTextOutput('alc'),
        h3('Your wine is'),h5('(please wait for few seconds after submitting)'),verbatimTextOutput('predic')
    )
))