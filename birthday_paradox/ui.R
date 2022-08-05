
library(shiny)


shinyUI(fluidPage(
    navbarPage(title='Birthday Paradox',
               tabPanel('simulacion',
                        sidebarLayout(
                          sidebarPanel(
                            sliderInput('N', label = 'Tamaño del Grupo:',
                                        min = 5,
                                        max=150,
                                        value = 20,
                                        step = 1),
                            numericInput('n',label = "Numero de persona la misma fecha de cumpleaños:",
                                         value = 2,step = 1),
                            numericInput('nsim',label = 'Numero de simulaciones:',
                                         value = 100,
                                         max = 1000,
                                         min=1, 
                                         step = 1)
                          ),
                          mainPanel(
                            verbatimTextOutput("probabilidad")
                          )
                        )
                        ),
               tabPanel('plot',h1('Grafica'))
               )
    
))
