
library(shiny)

library(rCharts)

shinyUI(
    navbarPage("NOAA Database Explorer",
          tabPanel("Documentation",
              mainPanel(
                h2("Instructions:"),
                p("The aim of this application is to show on a map severe weather events of the highest impact on both US population and US economy 
                  based on the information retrieved from U.S. National Oceanic and Atmospheric Administration's (NOAA) storm database."),            
                p("You can adjust date range and event types using control 
                  panel located on the left side of Plot panel."),
                p("Filtered dataset can be downloaded using data tab also on Plot panel. Database version used for this report contain entries for years 1950-2011."),
                h3("Warning:"),
                p("Due some heavy computations you have to wait some secondes before the maps are updated and shown.")
              )
            ),
          tabPanel("Plot",
                sidebarPanel(
                    sliderInput("range", 
                        "Range:", 
                        min = 1950, 
                        max = 2011, 
                        value = c(1993, 2011),
                        sep = ""
                    ),
                    uiOutput("evtypeControls"),
                    actionButton(inputId = "clear_all", label = "Clear selection", icon = icon("check-square")),
                    actionButton(inputId = "select_all", label = "Select all", icon = icon("check-square-o"))
                ),
  
                mainPanel(
                    tabsetPanel(
                        
                        # Data by state
                        tabPanel(p(icon("map-marker"), "By state"),
                            column(3,
                                wellPanel(
                                    radioButtons(
                                        "populationCategory",
                                        "Population impact category:",
                                        c("Both" = "both", "Injuries" = "injuries", "Fatalities" = "fatalities"))
                                )
                            ),
                            column(3,
                                wellPanel(
                                    radioButtons(
                                        "economicCategory",
                                        "Economic impact category:",
                                        c("Both" = "both", "Property damage" = "property", "Crops damage" = "crops"))
                                )
                            ),
                            column(7,
                                plotOutput("populationImpactByState"),
                                plotOutput("economicImpactByState")
                            )

                        ),
                        
                        # Time series data
                        tabPanel(p(icon("line-chart"), "By year"),
                                 h4('Number of events by year', align = "center"),
                                 showOutput("eventsByYear", "nvd3"),
                                 h4('Population impact by year', align = "center"),
                                 showOutput("populationImpact", "nvd3"),
                                 h4('Economic impact by year', align = "center"),
                                 showOutput("economicImpact", "nvd3")
                        ),
                                                
                        # Data 
                        tabPanel(p(icon("table"), "Data"),
                            dataTableOutput(outputId="table"),
                            downloadButton('downloadData', 'Download')
                        )
                    )
                )
        ),
        tabPanel("Server Operations",
          mainPanel(
            includeHTML("server.html")
              )
          )
       
    )
)
