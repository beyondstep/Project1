library(DT)
library(shiny)
library(shinydashboard)
library(ggplot2)
?icon
shinyUI(dashboardPage(
  
  skin = 'red',
  dashboardHeader(title = "Nov 2017 - June 2018"),
  dashboardSidebar(
    width = 250,
    sidebarUserPanel("Youtube Trend Videos", image = "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Logo_of_YouTube_%282015-2017%29.svg/1280px-Logo_of_YouTube_%282015-2017%29.svg.png"),
    sidebarMenu(
      menuItem("Summary Of Data", tabName = "Summary", icon = icon("list-alt")),
      menuItem("YoutuberMonthly$", tabName = "Monthly", icon = icon("fast-backward")),
      menuItem("VideoCategories", tabName = "Video", icon = icon("fast-forward")),
      menuItem("Countries Comparison", tabName = "Countries", icon = icon("play"))
    )),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    tabItems(
      tabItem(tabName = "Summary",
              fluidRow(infoBoxOutput("SumBox"),
                       infoBoxOutput("SumBox2"),
                       infoBoxOutput("SumBox3"),
                       infoBoxOutput("SumBox4"),
                       infoBoxOutput("SumBox5"),
                       infoBoxOutput("SumBox6")),
              fluidRow(box(htmlOutput("Summary"), height = 700, width = 1500))
              ),
      tabItem(tabName = "Monthly",
              fluidRow(box(plotOutput("Time"), height = 1700, width = 1000))
              ),
      tabItem(tabName = "Video",
              fluidPage(
                shinyUI(fluidPage(
                  titlePanel("VideoCategories"),
                  sidebarLayout(
                    sidebarPanel(
                      helpText("Choose Video Categories"),
                      selectInput("Video1",
                                  label = "VideoCategories:",
                                  choices = Categoriesdata$VideoCategories,
                                  selected = "Sports")
                    ),
                    mainPanel(plotOutput("GraphVideo", width = 800, height = 1000))
                  )
                ))
              )),
     
      tabItem(tabName = "Countries",
              fluidPage(
                shinyUI(fluidPage(
                  titlePanel("Countries Comparison"), # main title
                  sidebarLayout(
                    sidebarPanel(
                      helpText("Choose Two Countries"), ## subtitle
                      selectInput("Country1", # choose the residents
                                  label = "Country 1:",
                                  choices = Rawdata3$Country,
                                  selected = "USA"),
                      selectInput("Country2", # choose the residents
                                  label = "Country 2:",
                                  choices = Rawdata3$Country,
                                  selected = "Canada")
                    ),
                    mainPanel(plotOutput("GraphCountry1"),
                              (plotOutput("GraphCountry2"))
                    
                  )
                ))
                
              ))
      
    )
  )
)))

