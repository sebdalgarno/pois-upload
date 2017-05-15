## upload button
library(shiny)
library(shinyjs)

projstart <- "2014-01-01"

fluidPage(
  useShinyjs(),
  theme = "yeti.css",
  titlePanel("Horseshoe Lake Exploitation Study Data Entry"),
  
  div(id = "app",
    fluidRow(
      column(4,
             wellPanel(
               fileInput('vrl', 'Upload vrl file',
                         accept=c('.vrl'))
             ),
             
             actionButton("submit", "Submit (no undo)"),
             br(), br(),
             actionButton("reset", "Reset fields"),
             br(), br(),
             a(id = "instruct", "Show/hide instructions", href = "#"),
             shinyjs::hidden(
               div(id = "instructions",
                   p("1. Upload a .vrl file."),
                   p("2. For that vrl, specify the location and date that the receiver went in and out, using the fields in the sidebar."),
                   p("3. Click 'Submit to Dropbox' button to complete that vrl and start a new one."),
                   p("Note: you can only click the submit button once all location and date fields have been filled out.")
               )
             )
      ),
      
      column(4,
             h3("Receiver In"),
             wellPanel(
               textInput(inputId = "EastingIn", label = "Enter Easting (UTM):"),
               textInput(inputId = "NorthingIn", label = "Enter Northing (UTM):"),
               dateInput(inputId = "DateIn", label = "Select Date:", 
                         min = projstart, max = Sys.Date()+1,
                         value = Sys.Date()+1),
               textInput(inputId = "CommentsIn", label = "Comments")
             )
      ),
      
      column(4,
             h3("Receiver Out"),
             wellPanel(
               textInput(inputId = "EastingOut", label = "Enter Easting (UTM):"),
               textInput(inputId = "NorthingOut", label = "Enter Northing (UTM):"),
               dateInput(inputId = "DateOut", label = "Select Date:", 
                         min = projstart, max = Sys.Date()+1,
                         value = Sys.Date()+1),
               textInput(inputId = "CommentsOut", label = "Comments")
             )
      ))
  
  )
  
)

           
