library(shiny)
#library(plotly)
ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)
server <- function(input, output, session) {
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })

  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
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
