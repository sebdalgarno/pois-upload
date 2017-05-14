library(shiny)
source('dropbox.R')
library(shinyjs)

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
  
  observeEvent(input$reset, {
    shinyjs::reset("app")
  })
  
  observe ({
    if(input$submit == 0) return()
    

      else{
        
        df <- data.frame(EastingIn = input$EastingIn,
                         NorthingIn = input$NorthingIn,
                         DateIn = input$DateIn)
        
        saveDrop(df)
        
        output$success <- renderText({
          validate(
            need(input$EastingIn != '', "Please fill out all fields")
          )
        })

        output$success <- renderText("Successfully submitted!")
      }
    })
}

  



# df <- reactive({
#   df <- data.frame(EastingIn = input$EastingIn, 
#                    NorthingIn = input$NorthingIn)
# })
# 

# submit <- observe({
#   
# new <- observe({
#   if(input$new == 0 ) return()
#   else{
#     updateTextInput(session, "EastingIn", value = "")
#     updateTextInput(session, "NorthingIn", value = "")
#     output$success <- renderText("")
#   }
# })