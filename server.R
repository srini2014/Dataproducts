library(ElemStatLearn)
library(AppliedPredictiveModeling)
library(caret)
data(SAheart)
set.seed(8484)
chdRisk <- function(age1,sbp1) {
  ## Select only the sbp and Age columns as predictors
  traindat = SAheart[,c(1,9,10)]
  model <- train(chd ~ age + sbp, data = traindat, method = "glm", family = "binomial")
  ##Create the input dataset
  testdat = traindat[1,]
  testdat$age = age1
  testdat$sbp = sbp1
  chance = predict(model, newdata = testdat)*100
  chance
}


shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$age})
    output$inputValue2 <- renderPrint({input$sbp})
    output$prediction <- renderPrint({chdRisk(input$age,input$sbp)})
  }
)