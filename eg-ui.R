


library(shiny)

fluidPage(
  titlePanel("Uploading Files"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.csv')),
      tags$hr(),
      checkboxInput('header', 'Header', TRUE),
      radioButtons('sep', 'Separator',
                   c(Comma=',',
                     Semicolon=';',
                     Tab='\t'),
                   ','),
      radioButtons('quote', 'Quote',
                   c(None='',
                     'Double Quote'='"',
                     'Single Quote'="'"),
                   '"')
    ),
    mainPanel(
      tableOutput('contents')
    )
  )
)



### set up panels with date entry and comment outputs
fluidPage(
  titlePanel("Dates and date ranges"),
  
  column(4, wellPanel(
    dateInput('date',
              label = 'Date input: yyyy-mm-dd',
              value = Sys.Date()
    ),
    
    dateInput('date2',
              label = paste('Date input 2: string for starting value,',
                            'dd/mm/yy format, locale ja, range limited,',
                            'week starts on day 1 (Monday)'),
              value = as.character(Sys.Date()),
              min = Sys.Date() - 5, max = Sys.Date() + 5,
              format = "dd/mm/yy",
              startview = 'year', language = 'zh-TW', weekstart = 1
    ),
    
    dateRangeInput('dateRange',
                   label = 'Date range input: yyyy-mm-dd',
                   start = Sys.Date() - 2, end = Sys.Date() + 2
    ),
    
    dateRangeInput('dateRange2',
                   label = paste('Date range input 2: range is limited,',
                                 'dd/mm/yy, language: fr, week starts on day 1 (Monday),',
                                 'separator is "-", start view is year'),
                   start = Sys.Date() - 3, end = Sys.Date() + 3,
                   min = Sys.Date() - 10, max = Sys.Date() + 10,
                   separator = " - ", format = "dd/mm/yy",
                   startview = 'year', language = 'fr', weekstart = 1
    )
  )),
  
  column(6,
         verbatimTextOutput("dateText"),
         verbatimTextOutput("dateText2"),
         verbatimTextOutput("dateRangeText"),
         verbatimTextOutput("dateRangeText2")
  )
)

  