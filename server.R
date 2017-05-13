library(shiny)

function(input, output) {
  observeEvent(input$submit, {
    validate(
      need(input$EastingIn > 22222 & input$EastingIn < 33333 & 
              input$NorthingIn > 11111 & input$NorthingIn < 55555, 
           "Receiver In location is outside of Lake!"),
      need(input$EastingOut > 22222 & input$EastingOut < 33333 & 
             input$NorthingOut > 11111 & input$NorthingOut < 55555, 
           "Receiver Out location is outside of Lake!"),
      need(input$EastingIn, "Please fill out all spaces."),
      need(input$Eastingout, "Please fill out all spaces."),
      need(input$NorthingIn, "Please fill out all spaces."),
      need(input$NorthingOut, "Please fill out all spaces."),
      need(input$DateIn, "Please fill out all spaces."),
      need(input$DateOut, "Please fill out all spaces."),
      need(input$vrl, "Please upload a vrl file.")
    )
    
    data <- data.frame(EastingIn = input$EastingIn, NorthingIn = input$NorthingIn,
                       DateReceiverIn = input$DateIn,
                       EastingOut = input$EastingOut, NorthingOut = input$NorthingOut,
                       DateReceiverOut = input$DateOut
                       )
  })
  }



