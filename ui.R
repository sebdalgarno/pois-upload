## upload button
library(shiny)

projstart <- "2014-01-01"

fluidPage(theme = "yeti.css",
  titlePanel("Fish Exploitation Data Entry"),
  
  fluidRow(
    column(4,
           wellPanel(
             fileInput('vrl', 'Upload vrl file',
                       accept=c('.vrl'))
           ),
           
           wellPanel(
             actionButton("submit", "Submit to Dropbox")
           ),
           
           wellPanel(
             actionButton("new", "New submission")
           ),
  
           wellPanel(
             textOutput("success")
           )
           
    ),
    
    column(4,
           h3("Receiver In"),
           wellPanel(
             textInput(inputId = "EastingIn", label = "Enter Easting (UTM):"),
             textInput(inputId = "NorthingIn", label = "Enter Northing (UTM):"),
             dateInput(inputId = "DateIn", label = "Select Date:", 
                       min = projstart, max = Sys.Date())
           )
    ),
    
    column(4,
           h3("Receiver Out"),
           wellPanel(
             textInput(inputId = "EastingOut", label = "Enter Easting (UTM):"),
             textInput(inputId = "NorthingOut", label = "Enter Northing (UTM):"),
             dateInput(inputId = "DateOut", label = "Select Date:", 
                       min = projstart, max = Sys.Date())
           )
    ))
)

           
