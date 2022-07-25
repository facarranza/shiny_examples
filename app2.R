library(shiny)
#library(plotly)
ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table"),
  sliderInput("min","limit(minimun", value=50, min=0, max=100),
  textInput("name","whatś your name?"),
  passwordInput("password", "whats your password?"),
  textAreaInput("story", "tell me about"),
  numericInput("num", "Number One", value=0, min=0, max=100),
  sliderInput("rng", "range", value = c(10,20), min=0, max=100),
  dateInput("dob", "When were you born?"),
  dateRangeInput("holiday", "When do you want to go on vacation next?")



)
server <- function(input, output, session) {
  dataset <- reactive({
    get(input$dataset, "package:datasets")
    })

  output$summary <- renderPrint({
    summary(dataset())
  })

  output$table <- renderTable({
    dataset()
  })
}
# server <- function(input, output, session) {
#   ouput$summary <- renderPrint({dataset <- get(input$dataset, "package:datasets")
#     summary(dataset)
#   })
#
#   ouput$table <- renderTable({
#     dataset <- get(input$dataset, "package:datasets")
#     dataset
#   })
# }
shinyApp(ui, server)
