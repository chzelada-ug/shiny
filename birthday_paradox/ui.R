
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
                                         step = 1),
                            submitButton('Aplicar cambios')
                          ),
                          mainPanel(
                            verbatimTextOutput("probabilidad")
                          )
                        )
                        ),
               tabPanel('plot',
                        sidebarLayout(
                          sidebarPanel(
                            sliderInput('N2', label = 'Tamaño del Grupo:',
                                        min = 5,
                                        max=150,
                                        value = 20,
                                        step = 1),
                            numericInput('n2',label = "Numero de persona la misma fecha de cumpleaños:",
                                         value = 2,step = 1),
                            sliderInput('range_nsim',label = 'Rango simulacion',
                                        value = c(500,2000),min=10,max=5000),
                            numericInput('step',label = 'Step',value = 500),
                            submitButton('Aplicar cambios')
                                       ),
                          mainPanel(plotOutput('plotxy'))
                          
                        )
                        )
               )
    
))
