library(shiny)
library(shinyjs)
library(rdrop2)

outputDir <- "Shiny-vrl-uploads"

saveDrop <- function(data) {
  # Create a unique file name
  fileName <- sprintf("%s_%s.csv", as.integer(Sys.time()), digest::digest(data))
  # Write the data to a temporary file locally
  filePath <- file.path(tempdir(), fileName)
  write.csv(data, filePath, row.names = FALSE, quote = TRUE)
  # Upload the file to Dropbox
  drop_upload(filePath, dest = outputDir)
}

function(input, output, session) {
  observe({
    shinyjs::toggleState("submit", 
                         input$EastingIn != "" && 
                           input$NorthingIn != "" &&
                           input$DateIn != Sys.Date()+1 &&
                           input$EastingOut != "" && 
                           input$NorthingOut != "" &&
                           input$DateOut != Sys.Date()+1 &&
                           !is.null(input$vrl))
                           
  })
  
  shinyjs::onclick("instruct",
                   shinyjs::toggle(id = "instructions", anim = TRUE))  
  
  observeEvent(input$instruct, {
    shinyjs::alert("1. Upload a .vrl file.
                  2. For that vrl, \nspecify the location and date that the receiver went in and out, using the fields in the sidebar.
                  3. Click 'Submit to Dropbox' button to complete that vrl and start a new one. Note, you can only click the submit button once all location and date fields have been filled out.")
  })
  
  observeEvent (input$submit, {
    
        # conditions looking for human error
        if(input$EastingIn != 22) return(shinyjs::alert("Location is not within lake"))
        
        else{
          withProgress(message = "Uploading...", value = 0, {
            df <- data.frame(EastingIn = input$EastingIn,
                             NorthingIn = input$NorthingIn,
                             DateIn = input$DateIn)
            
            saveDrop(df)
            
            incProgress(0.5)
            
          })
          
          shinyjs::info("Successfully submitted!")
          shinyjs::reset("app")
          
        }
      })
}
