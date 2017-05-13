
### upload
library(shiny)

function(input, output) {
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    read.csv(inFile$datapath, header=input$header, sep=input$sep, 
             quote=input$quote)
  })
}



### output comments
function(input, output, session) {
  
  # input$date and others are Date objects. When outputting
  # text, we need to convert to character; otherwise it will
  # print an integer rather than a date.
  output$dateText  <- renderText({
    paste("input$date is", as.character(input$date))
  })
  
  output$dateText2 <- renderText({
    paste("input$date2 is", as.character(input$date2))
  })
  
  output$dateRangeText  <- renderText({
    paste("input$dateRange is", 
          paste(as.character(input$dateRange), collapse = " to ")
    )
  })
  
  output$dateRangeText2 <- renderText({
    paste("input$dateRange2 is", 
          paste(as.character(input$dateRange2), collapse = " to ")
    )
  })
}

Code license: MIT
Date and date range
by Winston Chang <winston@rstudio.com>
  