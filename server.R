library(DT)
library(shiny)
library(googleVis)
library(ggplot2)
library(ggthemes)

shinyServer(function(input, output)({
  output$GraphCountry1 <- renderPlot({
    Rawdata3%>%filter(Country == input$Country1)%>%
      ggplot(., aes(x = Category, y = Total))+geom_bar(stat = "identity")+ scale_fill_manual(values=c("#FF6666"))+ theme(plot.subtitle = element_text(vjust = 1), 
                                                                               plot.caption = element_text(vjust = 1), 
                                                                               axis.ticks = element_line(colour = "gold", 
                                                                                                         size = 3.5), panel.grid.major = element_line(linetype = "blank"), 
                                                                               panel.grid.minor = element_line(linetype = "blank"), 
                                                                               axis.title = element_text(size = 19, 
                                                                                                         face = "bold.italic", colour = "bisque"), 
                                                                               axis.text.x = element_text(family = "Roboto Condensed", 
                                                                                                          size = 17, colour = "white"), axis.text.y = element_text(family = "Roboto Condensed", 
                                                                                                                                                                   size = 18, colour = "chartreuse2"), 
                                                                               plot.title = element_text(size = 20, 
                                                                                                         face = "bold.italic", colour = "firebrick1", 
                                                                                                         vjust = 7), legend.title = element_text(colour = "aquamarine2"), 
                                                                               panel.background = element_rect(fill = "thistle2"), 
                                                                               plot.background = element_rect(fill = "gray12"), 
                                                                               legend.key = element_rect(fill = "darkred")) +labs(x = "Categories")
    
  })
  output$GraphCountry2 <- renderPlot({
    Rawdata3%>%filter(Country == input$Country2)%>%
      ggplot(aes(x = Category, y = Total))+geom_bar(stat = "identity")+ scale_fill_manual(values=c("#FF6666"))+theme(plot.subtitle = element_text(vjust = 1), 
                                                                              plot.caption = element_text(vjust = 1), 
                                                                              axis.ticks = element_line(colour = "gold", 
                                                                                                        size = 3.5), panel.grid.major = element_line(linetype = "blank"), 
                                                                              panel.grid.minor = element_line(linetype = "blank"), 
                                                                              axis.title = element_text(size = 19, 
                                                                                                        face = "bold.italic", colour = "bisque"), 
                                                                              axis.text.x = element_text(family = "Roboto Condensed", 
                                                                                                         size = 17, colour = "white"), axis.text.y = element_text(family = "Roboto Condensed", 
                                                                                                                                                                  size = 18, colour = "chartreuse2"), 
                                                                              plot.title = element_text(size = 20, 
                                                                                                        face = "bold.italic", colour = "firebrick1", 
                                                                                                        vjust = 7), legend.title = element_text(colour = "aquamarine2"), 
                                                                              panel.background = element_rect(fill = "thistle2"), 
                                                                              plot.background = element_rect(fill = "gray12"), 
                                                                              legend.key = element_rect(fill = "darkred")) +labs(x = "Categories")
    
  })    
  output$GraphVideo <- renderPlot({
    Categoriesdata%>%filter(VideoCategories == input$Video1)%>%
      ggplot(aes(x = Country, y = TotalViews, fill = Country)) + geom_bar(width = 1, stat = "identity") + coord_polar(theta = "x") + theme(plot.subtitle = element_text(vjust = 1), 
                                                                                                                                           plot.caption = element_text(vjust = 1), 
                                                                                                                                           panel.grid.major = element_line(linetype = "blank"), 
                                                                                                                                           panel.grid.minor = element_line(linetype = "blank"), 
                                                                                                                                           axis.title = element_text(family = "Roboto Condensed", 
                                                                                                                                                                     size = 14, face = "bold", colour = "chartreuse3"), 
                                                                                                                                           axis.text.x = element_text(family = "Roboto Condensed", 
                                                                                                                                                                      size = 11), axis.text.y = element_text(family = "Roboto Condensed", 
                                                                                                                                                                                                             size = 12), plot.title = element_text(family = "Roboto Condensed", 
                                                                                                                                                                                                                                                   size = 20, colour = "beige"), legend.text = element_text(size = 1), 
                                                                                                                                           legend.title = element_text(size = 1), 
                                                                                                                                           panel.background = element_rect(fill = "aliceblue"), 
                                                                                                                                           plot.background = element_rect(fill = "black"), 
                                                                                                                                           legend.key = element_rect(size = 0.1), 
                                                                                                                                           legend.background = element_rect(size = 0)) +labs(title = "Categorical Videos") + theme(axis.title = element_text(family = ), 
                                                                                                                                                                                                                                   plot.title = element_text(family = ), 
                                                                                                                                                                                                                                   legend.position = "none") + theme(axis.line = element_line(size = 1.1), 
                                                                                                                                                                                                                                                                     panel.grid.major = element_line(size = 0), 
                                                                                                                                                                                                                                                                     axis.title = element_text(family = , 
                                                                                                                                                                                                                                                                                               size = 27), axis.text = element_text(size = 19, 
                                                                                                                                                                                                                                                                                                                                    face = "bold"), plot.title = element_text(hjust = 5))
      
  })
  output$Time <- renderPlot({
    ggplot(data = Timeseries5, aes(x = period, y = TotalMonthlyMonetize)) +
      geom_line()+
      scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "4 weeks")+ theme(plot.subtitle = element_text(vjust = 1), 
                                                                            plot.caption = element_text(vjust = 1), 
                                                                            axis.line = element_line(colour = "azure4"), 
                                                                            axis.ticks = element_line(linetype = "blank"), 
                                                                            axis.title = element_text(size = 14, 
                                                                                                      face = "bold", colour = "bisque1"), 
                                                                            axis.text.x = element_text(family = "mono", 
                                                                                                       size = 12, colour = "white"), axis.text.y = element_text(family = "mono", 
                                                                                                                                                                size = 14, colour = "darkgoldenrod2"), 
                                                                            plot.title = element_text(size = 18, 
                                                                                                      face = "bold", colour = "chartreuse3", 
                                                                                                      hjust = 0.5), panel.background = element_rect(fill = "cornsilk1"), 
                                                                            plot.background = element_rect(fill = "darkred")) +labs(title = "Total monthly Monetization for Youtuber")
  })
 # show map using googleVis
  output$Summary <- renderGvis({
    gvisGeoChart(Top3List11, 
                 locationvar = "Country", 
                 hovervar = "Title1", 
                 options = list(backgroundColor= "midnightblue", width = 1500, height = 600))
  })
  
  # show histogram using googleVis
  output$VideoCategories <- renderPlot({
    ggplot(data = VideoCategories, aes(x = TotalLikes, y = TotalDis))+geom_point(aes(size = TotalViews, color = VideoCategories)) + 
      theme(plot.subtitle = element_text(vjust = 1), 
            
            plot.caption = element_text(vjust = 1), 
            
            axis.line = element_line(colour = "antiquewhite", 
                                     
                                     linetype = "solid"), panel.grid.major = element_line(colour = "cornsilk2"), 
            
            panel.grid.minor = element_line(colour = "ghostwhite"), 
            
            axis.title = element_text(size = 17), 
            
            axis.text.x = element_text(family = "serif", 
                                       
                                       size = 12, colour = "white"), axis.text.y = element_text(family = "serif", 
                                                                                                
                                                                                                size = 11, colour = "darkgoldenrod1"), 
            
            plot.title = element_text(family = "Roboto Condensed", 
                                      
                                      size = 18, colour = "coral1"), panel.background = element_rect(fill = "lightblue2", 
                                                                                                     
                                                                                                     colour = "cornflowerblue", size = 2.1, 
                                                                                                     
                                                                                                     linetype = "solid"), plot.background = element_rect(fill = "gray4", 
                                                                                                                                                         
                                                                                                                                                         size = 2.9, linetype = "solid"), 
            
            legend.position = "top", legend.direction = "horizontal") +labs(title = "Categorical Summary") + theme(plot.title = element_text(family = ), 
                                                                                                                   
                                                                                                                   legend.background = element_rect(fill = "darksalmon"), 
                                                                                                                   
                                                                                                                   legend.position = "none") + theme(axis.text.x = element_text(size = 13), 
                                                                                                                                                     
                                                                                                                                                     legend.position = "top") +labs(y = "TotalDislikes") + theme(plot.title = element_text(family = ))
    
  })
  plotOutput("VideoCategories", width = 700, height = 500)
  # show data using DataTable
  output$table <- DT::renderDataTable({
    
  })
  
  # show statistics using infoBox
  output$SumBox <- renderInfoBox({
    Total_value <- format(sum(RegionSummary$TotalViews), big.mark = ",")
    Total_valuename <- "Total Number Of Views"
    infoBox(Total_valuename, Total_value, icon = icon("eye"), fill = T, color = "black")
  })
  output$SumBox2 <- renderInfoBox({
    Total_Monetize <- format(sum(RegionSummary$TotalMonetize), big.mark = ",")
    Total_Monetizename <- "Total Dollar($)"
    infoBox(Total_Monetizename, Total_Monetize, icon = icon("qq"), fill = T, color = "navy")
  })
  output$SumBox3 <- renderInfoBox({
    Interaction_rate <- format(sum(RegionSummary$TotalLikes), big.mark = ",")
    Total_Likes <- "Total Number Of Likes"
    infoBox(Total_Likes, Interaction_rate, icon = icon("thumbs-up"), fill = T, color = "yellow")
  })
  output$SumBox4 <- renderInfoBox({
    TotalUniqueTrendvideos <- format(nrow(LatestRecord), big.mark = ",")
    Total_Unique <- "Unique Trend Videos"
    infoBox(Total_Unique, TotalUniqueTrendvideos, icon = icon("stop"), fill = T, color = "red")
  })
  output$SumBox5 <- renderInfoBox({
    TotalDislikes <- format(sum(RegionSummary$TotalDis), big.mark = ",")
    Total_Dislikes <- "Total Number of Dislikes"
    infoBox(Total_Dislikes, TotalDislikes, icon = icon("thumbs-down"), fill = T, color = "green")
  })
  output$SumBox6 <- renderInfoBox({
    TotalComments <- format(sum(RegionSummary$TotalComments), big.mark = ",")
    Total_Comment <- "Total Comments"
    infoBox(Total_Comment, TotalComments, icon = icon("twitter"), fill = T, color = "blue")
  })
  }))

