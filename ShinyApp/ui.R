library(rsconnect)
library(shinythemes)
library(shiny)
library(dplyr)
library(googleway)

api_key <- "AIzaSyDfF30q_BimvlsyBhXgXokM3kj-I8v-3ng"
locations <- read.csv("locations.csv")


ui <- fluidPage(theme = shinytheme("slate"),
                tags$h1("Clincs Offerings Vaccines"),
                fluidRow(
                  column(
                    width = 3,
                    tags$style(HTML("
                    .shiny-input-container>div>select:not(.selectized) {
                      width: 100%;
                      height: 300px;
                    }" )),
                    #Select Choice box for country/state
                    selectInput(inputId = "inputLocation", label = "Select Location:", 
                                multiple = TRUE, selectize=FALSE, choices = sort(unique(locations$LOCATION)), selected = "Pennsylvania"),
                    tags$h4("Required Vaccines"),
                    textOutput("AlertBox")
                    
                    
                    
                  ),
                  column(
                    width = 9,
                    p("Welcome to Vaccine.io. Choose a state or country to see what vaccines are required. Use the Google Search bar to find the nearest pharmacies and clinics nearby."),
                    google_mapOutput(outputId = "map", height = '900px')
                    
                  )
                  
                )
)




