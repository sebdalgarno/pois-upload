## upload button
library(shiny)

projstart <- "2014-01-01"

fluidPage(
  titlePanel("Upload and check"),
  
  fluidRow(
    column(4,
           wellPanel(
             fileInput('vrl', 'Upload vrl file',
                       accept=c('.vrl'))
           ),
           wellPanel(
             actionButton("submit", "Submit to Dropbox!")
           ),
           
           wellPanel(
             actionButton("next", "Next vrl")
           )
           
    ),
    
    column(4,
           h3("Receiver In"),
           wellPanel(
             textInput(inputId = "EastingIn", label = "Enter Easting"),
             textInput(inputId = "NorthingIn", label = "Enter Northing"),
             dateInput(inputId = "DateIn", label = "Select Date", 
                       min = projstart, max = Sys.Date())
           )
    ),
    
    column(4,
           h3("Receiver Out"),
           wellPanel(
             textInput(inputId = "EastingOut", label = "Enter Easting"),
             textInput(inputId = "NorthingOut", label = "Enter Northing"),
             dateInput(inputId = "DateOut", label = "Select Date", 
                       min = projstart, max = Sys.Date())
           )
    ))
)

           
