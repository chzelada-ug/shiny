
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


shinyServer(function(input, output) {

output$probabilidad <- renderPrint({
  prob <- birthday_paradox(input$N,input$n,input$nsim)
  paste0("La probabilidad que de un grupo de ",
         input$N, " personas ", input$n, " cumplan años el mismo dia es de ",
         prob)
})    

})
