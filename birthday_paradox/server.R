
library(shiny)


check_nequal <- function(n=2,vec){
  vec<-as.vector(table(vec))
  x<-which(vec==n)
  if(length(x)==0 ) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

test_group <- function(id,N=23,n=2){
  grupo <- sample(1:365,size = N,replace = TRUE )
  return(check_nequal(n,grupo))
}


birthday_paradox <- function(N,n,nsim){
  sims<-sapply(1:nsim,test_group,N=N,n=n)
  return(sum(sims)/nsim)
}

nsim_bp <- function(nsim,N,n){
  p <- birthday_paradox(N=N,n=n,nsim = nsim)
  return(p)
}


# x <- sapply( seq(10,10000,by=1000) , nsim_bp,N=23,n=2)
# plot(seq(10,10000,by=1000),x,type = 'l')


shinyServer(function(input, output) {

output$probabilidad <- renderPrint({
  prob <- birthday_paradox(input$N,input$n,input$nsim)
  paste0("La probabilidad que de un grupo de ",
         input$N, " personas ", input$n, " cumplan años el mismo dia es de ",
         prob)
})

output$plotxy <- renderPlot({
  x <- sapply( seq(input$range_nsim[1],input$range_nsim[2],by=input$step) , 
               nsim_bp,
               N=input$N2,
               n=input$n2)
  plot(seq(input$range_nsim[1],input$range_nsim[2],by=input$step),
       x,
       type = 'l',
       title='Cambio en la probabilidad por aumento de simulaciones',
       xlab='Simulaciones',ylab='Probabilidad')
})

})
