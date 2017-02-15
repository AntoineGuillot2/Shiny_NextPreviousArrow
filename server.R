
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#


library(shiny)
library(shinydashboard)

Previous_Button=tags$div(actionButton("Prev_Tab",HTML('<div class="col-sm-4"><i class="fa fa-angle-double-left fa-2x"></i></div>
                                                                  ')))
Next_Button=div(actionButton("Next_Tab",HTML('<div class="col-sm-4"><i class="fa fa-angle-double-right fa-2x"></i></div>')))


shinyServer(function(input, output,session) {
  output$Next_Previous=renderUI({
   tab_list=input$List_of_tab[-length(input$List_of_tab)]
    nb_tab=length(tab_list)
    if (which(tab_list==input$tabBox_next_previous)==nb_tab)
      column(1,offset=1,Previous_Button)
    else if (which(tab_list==input$tabBox_next_previous)==1)
      column(1,offset = 10,Next_Button)
    else
      div(column(1,offset=1,Previous_Button),column(1,offset=8,Next_Button))
  
  })
  observeEvent(input$Prev_Tab,
               {
                 tab_list=input$List_of_tab
                 current_tab=which(tab_list==input$tabBox_next_previous)
                 updateTabsetPanel(session,"tabBox_next_previous",selected=tab_list[current_tab-1])
               }
  )
  observeEvent(input$Next_Tab,
               {
                 tab_list=input$List_of_tab
                 current_tab=which(tab_list==input$tabBox_next_previous)
                 updateTabsetPanel(session,"tabBox_next_previous",selected=tab_list[current_tab+1])
               }
  )

})
