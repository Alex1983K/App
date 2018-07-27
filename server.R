library(quantmod)
library(forecast)

djia <- function(m){
	getSymbols("DJI")
	mDJ <- to.monthly(DJI)
	mDJcl <- Cl(mDJ)
	tsDJ <- ts(mDJcl, frequency=12)
	model <- ets(tsDJ, model="MMM")
	fcast <- forecast(model, h=m)
	return(fcast)
}

shinyServer(
	function(input, output){
		output$forecast <- renderPrint({djia(input$m)$mean[input$m]})
		output$low95 <- renderPrint({djia(input$m)$lower[input$m, 2]})
		output$low80 <- renderPrint({djia(input$m)$lower[input$m, 1]})
		output$high80 <- renderPrint({djia(input$m)$upper[input$m, 1]})
		output$high95 <- renderPrint({djia(input$m)$upper[input$m, 2]})
		output$fcast <- renderPlot({plot(djia(input$m), main="DJIA Index since March 1, 2007", xlab="Month", ylab="DJIA Index")})	
     
	}

)