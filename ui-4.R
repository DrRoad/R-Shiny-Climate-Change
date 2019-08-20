library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Temperature and CO2 Analysis Over the Years"),
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(condition = "input.myTabs == 1",
        numericInput("xmin", "Minimum Year:", 1840),
        numericInput("xmax", "Maximum Year:", 2018),
        numericInput("ymin", "Minimum Temperature:", 0),
        numericInput("ymax", "Maximum Temperature:", 10),
        checkboxInput("monthlyDataAdded", strong("Add the Average Temperature Data Obtained from Combining Various Months of the Years?"), FALSE),
        checkboxInput("minMaxAdded", strong("Add the Average Minimum/Maximum Temperate from all Sets of Data?"), FALSE)
                ),
      conditionalPanel(condition = "input.myTabs == 2",
        checkboxInput("co2PlotAdded",strong("Plot the CO2 Data Over the Years?"), FALSE),
        conditionalPanel(condition = "input.co2PlotAdded == true",
          helpText(HTML("<h3>You might want to see the relationship between temperature and co2 over the years?</h3>")),
          checkboxInput("co2AndTempAdded", strong("Plot the CO2 and Temp Relationship?"), FALSE)
                         ),
        checkboxInput("WindPlotAdded",strong("Plot the Windspeed Data Over the Years?"), FALSE),
        conditionalPanel(condition = "input.WindPlotAdded == true",
                         helpText(HTML("<h3>You might want to see the relationship between temperature and windspeed over the years?</h3>")),
                         checkboxInput("windAndTempAdded", strong("Plot the Windspeed and Temp Relationship?"), FALSE)
                        )
                       
                       
                       
                       )
    ),
    mainPanel(
        tabsetPanel(id = "myTabs",type = "tabs",
                    tabPanel("Tempearture Over the Years",value = 1, plotOutput("TempPlot")),
                    tabPanel("Temperature-CO2 and Temperature-WindSpeed",value = 2, plotOutput("Co2AndWindPlot")),
                    tabPanel("About",source("about.R")$value())
                   )
)
)
))