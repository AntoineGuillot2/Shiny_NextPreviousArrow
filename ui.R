
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinydashboard)




dashboardPage(
  dashboardHeader(disable = T),
  dashboardSidebar(disable = T),
  dashboardBody(box(width=12,
    tabBox(width=12,id="tabBox_next_previous",
           tabPanel("Tab1",p("This is tab 1")),
           tabPanel("Tab2",p("This is tab 2")),
           tabPanel("Tab3",p("This is tab 3")),
           tabPanel("Tab4",p("This is tab 4")),
           tags$script("
                       $('body').mouseover(function() {
                       list_tabs=[];
                       $('#tabBox_next_previous li a').each(function(){
                       list_tabs.push($(this).html())
                       });
                       Shiny.onInputChange('List_of_tab', list_tabs);})
                       "
           )
    ),
    uiOutput("Next_Previous")
    ))
)
