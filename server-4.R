library(shiny)
library(dplyr)

shinyServer(function(input, output) {
  
  xCo2 <- reactive({
    read.csv("Co2World.csv",header = TRUE)
  })
  xMin <- reactive({
    read.csv("MinTemp.csv",header = TRUE)
  })
  xMax <- reactive({
    read.csv("MaxTemp.csv",header = TRUE)
  })
  xMean <- reactive({
    read.csv("MeanTemp.csv",header = TRUE)
  })
  xWind <- reactive({
    read.csv("WindSpeed.csv",header = TRUE)
  })
  
  output$TempPlot <- renderPlot({
    
    yearly = group_by(xMean(),Year)
    averageOfMeanData = summarize(yearly, avg = mean(cbind(Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Oct,Nov,Dec),na.rm=TRUE),mean(Annual,na.rm=TRUE))
    XLIMITS = c(input$xmin, input$xmax)
    YLIMITS = c(input$ymin, input$ymax)
    plot(averageOfMeanData$Year,averageOfMeanData$avg,
         type='l',
         xlim = XLIMITS,main = "Average Temperature Across Canada Throughout the Years",
         xlab = "Years",
         ylab = "Temperature",
         ylim = YLIMITS)
    legend("topright",col = c(1,2,3,4),lty = c(1,1,1,1),
           c("Combining the Data for Each Month of the Year and then Averaging",
             "Averaging the Annual Column of MeanTemp Data Across All Regions",
             "Minimum Temperature","Maximum Temperature"))
    if(input$monthlyDataAdded){
    lines(averageOfMeanData$Year,averageOfMeanData$`mean(Annual, na.rm = TRUE)`,col=2)
    }
    if(input$minMaxAdded){
      yearly2 = group_by(xMin(),Year)
      averageOfMinData = summarize(yearly2, avg = mean(cbind(Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Oct,Nov,Dec),na.rm=TRUE),mean(Annual,na.rm=TRUE))
      lines(averageOfMinData$Year,averageOfMinData$avg,col = 3)
      
      yearly3 = group_by(xMax(),Year)
      averageOfMaxData = summarize(yearly3, avg = mean(cbind(Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Oct,Nov,Dec),na.rm=TRUE),mean(Annual,na.rm=TRUE))
      lines(averageOfMaxData$Year,averageOfMaxData$avg,col = 4)
    }
  })
  output$Co2AndWindPlot <- renderPlot({
    
    
    if(input$co2PlotAdded){
      plot(xCo2()$YearDecimal,xCo2()$Value,main = "CO2 ppm Trend Over the Years",xlab= "Year",ylab = "CO2(ppm)",type ='l')
      if(input$co2AndTempAdded){
    
        chosenTemp = subset(xMean(),xMean()$InfoTemp.1. == 1)
        chosenTempGrouped = group_by(chosenTemp,Year)
        chosenTempSummary = summarize(chosenTempGrouped, avgTemp = mean(Annual,na.rm = TRUE))
        chosenCo2Grouped = group_by(xCo2(),Year)
        chosenCo2Summary = summarize(chosenCo2Grouped, avgCo2 = mean(Value,na.rm = TRUE))
        total = merge(chosenTempSummary,chosenCo2Summary, by = c("Year"))
        plot(total$avgTemp,total$avgCo2,type='p', main = "Relationship between Average Temperature and CO2", xlab = 'Temperature', ylab= 'CO2(PPM)')
      }
    }
    if(input$WindPlotAdded){
      gpWind = group_by(xWind(),Year)
      avgWind = summarize(gpWind,
                          avg = mean(cbind(Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Oct,Nov,Dec),na.rm=TRUE),
                          avg2 = mean(Annual,na.rm=TRUE))
      plot(avgWind$Year,avgWind$avg,col = 1,type = 'l',
           main = "WindSpeed over the Years",xlab = "Year",ylab = "WindSpeed")
      if(input$windAndTempAdded){
        total2 = merge(chosenTempSummary,avgWind, by = c("Year"))
        plot(total2$avgTemp,total2$avg,main = "Relationship between Windspeed and Mean Temperature",xlab = "Temperature",ylab = "Windspeed")
      }
    }
  })
})