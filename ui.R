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
        tabsetPanel(
            tabPanel("Prediction", 
                     h3('Your choices are'),
                     h4('Wine density, in g/mL'),verbatimTextOutput('dens'),
                     h4('Wine total sulfur dioxide, in mg/L'),verbatimTextOutput('totso2'),
                     h4('Wine residual sugar, in g/L'),verbatimTextOutput('rs'),
                     h4('Wine alcoholic content, in %'),verbatimTextOutput('alc'),
                     h3('Your wine is'),h5('(please wait for few seconds after submitting)'),verbatimTextOutput('predic')
                     ), 
            tabPanel("Reference", 
                     h3("This application is based on the following work :"),
                     tags$p(),
                     tags$i("P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis."),tags$br(), 
                     tags$i("Modeling wine preferences by data mining from physicochemical properties."),tags$br(),
                     tags$i("In Decision Support Systems, Elsevier, 47(4):547-553. ISSN: 0167-9236."),tags$br(),
                     tags$p(),
                     tags$i("Available at:"), tags$br(),
                     tags$i("[@Elsevier] - http://dx.doi.org/10.1016/j.dss.2009.05.016"),tags$br(),
                     tags$i("[Pre-press (pdf)] - http://www3.dsi.uminho.pt/pcortez/winequality09.pdf"),tags$br(),
                     tags$i("[bib] - http://www3.dsi.uminho.pt/pcortez/dss09.bib")
                    ),
            tabPanel("Summary and instructions",
                     h3('Summary - Evaluating typical properties of wines App'),
                     tags$p("The mentioned work tested 1,599 samples of red and 4,898 samples of white variants of the Portuguese 'Vinho Verde' wine. Each sample was tested for the following variables :"),
                     tags$li("Fixed acidity"),
                     tags$li("Volatile acidity"),
                     tags$li("Citric acid"),
                     tags$li("Residual sugar"),
                     tags$li("Chlorides"),
                     tags$li("Free sulfur dioxide"),
                     tags$li("Total sulfur dioxide"),
                     tags$li("Density"),
                     tags$li("pH"),
                     tags$li("Sulphates"),
                     tags$li("Alcohol"),tags$br(),
                     tags$p("Based on this data, a prediction model using Random Forests method with 'bigrf' packacage was built, using the most relevant chemical variables which differentiate a white wine from a red wine."),
                     tags$p("So, changing the values for density, total sulfur dioxide, residual sugar and alcoholic contents, it is possible to predict if that particular set of characteristics is typical from a red or white wine."),
                     h3('Examples'),
                     tags$li("Density = 0.995g/mL, Total sulfur dioxide = 120mg/L, Residual sugar = 3g/L and Alcohol = 10%, is a typical set of characteristics of 'white wine'."),
                     tags$li("Density = 0.995g/mL, Total sulfur dioxide = 50mg/L, Residual sugar = 3g/L and Alcohol = 10%, is a typical set of characteristics of 'red wine'."),
                     tags$li("Density = 1.002g/mL, Total sulfur dioxide = 210mg/L, Residual sugar = 17g/L and Alcohol = 10%, is a typical set of characteristics of 'white wine'."),
                     tags$li("Density = 1.002g/mL, Total sulfur dioxide = 120mg/L, Residual sugar = 3g/L and Alcohol = 10%, is a typical set of characteristics of 'red wine'."), tags$br(),
                     tags$p("Now it is your tun ! Try it !"),
                     tags$p("I hope you enjoy it !"),
                     tags$br(),tags$br()
        )
    )
    )
))