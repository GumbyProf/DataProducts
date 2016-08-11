library(shiny)

#This converts mpg into l/100km.
#I think it's cool because it's an inverse calculation

shinyServer(
      function(input, output) {
            output$mpg <- renderText(input$mpg)
            output$lp100km <- renderText(235.21458329475 / input$mpg)
      }
)