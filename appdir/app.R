# load the shiny package
library(shiny)

# define the user interface object with the appearance of the app
ui <- fluidPage(
  titlePanel("Example of sidebar layout"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput(
        inputId = "n", label = "Sample size",
        value = 25
      )
    ),
    
    mainPanel(
      plotOutput(outputId = "hist")
    )
  )
)

# define the server function with instructions to build the
# objects displayed in the ui
server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$n))
  })
}

# call shinyApp() which returns the Shiny app object
shinyApp(ui = ui, server = server)
