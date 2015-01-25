library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Heart Disease prediction based on age and sbp(systolic blood pressure)"),
    
    sidebarPanel(
      numericInput('age', 'Age', 40, min = 10, max = 100, step = 1),
      numericInput('sbp', 'systolic blood pressure', 120, min = 101, max = 218, step = 1),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('You entered Age of'),
      verbatimTextOutput("inputValue"),
      h4('You entered sbp'),
      verbatimTextOutput("inputValue2"),
      
      h4('Your chances of Coronary Heart Disease [%] is '),
      verbatimTextOutput("prediction")
    )
  )
)
