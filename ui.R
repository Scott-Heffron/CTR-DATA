# Coursera - Developing Data Products- Course Project

# ui.R file for the shiny app

# This app was developed to help people choose the best car for their trip, using mtcars dataset, from [R] 

library(markdown)
library(DT)

shinyUI(navbarPage("Best Car Selection for your Trip",
        tabPanel("Table",
                   
        # Sidebar
        sidebarLayout(
            sidebarPanel(
                helpText("Provide information about your trip and the characteristics of the type of car that you would like to use."),
                numericInput('dis', 'Distance (in miles):', 250, min = 1, max = 4800),
                numericInput('cost', 'Gas Price (per gallon):', 3.25, min = 2, max = 4, step=0.01),
                numericInput('gas', 'Total funds for gasoline:', 50, min=1, max=1000),
                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6), inline = TRUE),
                sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,300), step=10),
                sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,180), step=10),
                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1), inline = TRUE)
               # actionButton("go", "Update")
            ),
            
            
            mainPanel(
               DT::dataTableOutput('table')
            )
        )
),
        tabPanel("About",
            mainPanel(
                includeMarkdown("about.md")
            )
        )
    )
)   