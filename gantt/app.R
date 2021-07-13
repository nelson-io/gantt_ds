source('script.R',encoding = "UTF-8")

library(shiny)

# Define UI for application 
ui <- fluidPage(

    # Application title
    titlePanel("Gantt curso DS"),


        # Show a plot of the gantt
        mainPanel(
            plotlyOutput("gantt")
        )
    )
# )

# Define server logic required 
server <- function(input, output) {

    output$gantt <- renderPlotly({
        
p
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
