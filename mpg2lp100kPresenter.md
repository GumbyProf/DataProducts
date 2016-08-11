App: mpg2lp100k
========================================================
author: K. Scott Alberts
date: August 11, 2016
autosize: true

mpg2lp100k Explanation
========================================================

This shiny app converts fuel efficiency from Miles per Gallon
(the American standard ) to Liters per 100 kilometers (everyone else).
I think it's cool because it's an inverse calculation

The app uses a slider to input the mpg, by .25 mpg
I used 23 as the default because that's what my car gets (Minivan!)

- Code Example
- ui.R
- Server.R


Sample conversion
========================================================
Here is an example of what the code does

```r
#convert 30 mpg into L/100km
235.21458329475 / 30
```

```
[1] 7.840486
```

```r
#convert 50 mpg into L/100km
235.21458329475 / 100
```

```
[1] 2.352146
```

ui.R code
========================================================


```r
library(shiny)  #I don't know if this is needed, but it's free
shinyUI(fluidPage(
      #Title
      titlePanel("Fuel Efficiency Converter"),
      #Subtitle
      h4("Converting miles per gallon into liters per 100 kilometers"),
      h5("A project for the Johns Hopkins Coursera 
         'Developing Data Products' Course"),
      h6("Developer: K. Scott Alberts"),
      hr(),
      sidebarLayout(
            sidebarPanel(
                  # Allows values from 0 to 100 mpg
                  sliderInput("mpg", label = "Miles per Gallon", 
                              min = 10, max = 60, value = 23, step= 0.5),
                  
                  h5("Please slide the bar to the mpg you want to convert"),
                  h5("The range is limited from 10 to 60 (sorry Hummer and hybrids)"),
                  h6("FYI, the conversion rate is L/100km = 235.21/mpg")
            ),
            mainPanel(
                  h2(textOutput('mpg')),
                  h2("is the value you entered on the slider, in miles per gallon."),
                  h2(textOutput('lp100km')),
                  h2("is the computed value, in Liters per 100 km.")
            )
      ))
)
```

Server.R code
========================================================

```r
library(shiny)

#This converts mpg into l/100km.
#I think it's cool because it's an inverse calculation

shinyServer(
      function(input, output) {
            output$mpg <- renderText(input$mpg)
            output$lp100km <- renderText(235.21458329475 / input$mpg)
      }
)
```
