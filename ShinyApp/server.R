library(rsconnect)
library(shinythemes)
library(shiny)
library(dplyr)
library(googleway)
library(data.table)

api_key <- "AIzaSyDfF30q_BimvlsyBhXgXokM3kj-I8v-3ng"
locations <- read.csv("locations.csv")

vaccines <- read.csv("vaccines.csv")
df_vaccines <- data.table(vaccines)

function(input, output) {
  data <- reactive({
    locations %>% filter(LOCATION %in% input$inputLocation)
  })
  
  output$map <- renderGoogle_map({
    google_map(data = data(), key = api_key, zoom = 0,
               map_type_control = TRUE,
               zoom_control = TRUE,
               street_view_control = TRUE,
               search_box = TRUE
               
    ) %>%
      add_markers(lat = "X", lon = "Y")
  })
  #Alert box for what vaccines are needed to enter this area
  output$AlertBox <- renderPrint(df_vaccines$Required.Recommend.Vaccines
                                 [df_vaccines$Country == input$inputLocation])
  
}

