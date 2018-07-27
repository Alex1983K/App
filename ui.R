shinyUI(pageWithSidebar(
	headerPanel("Forecasting Dow Jones Industrial Average Index"),
	sidebarPanel(
		sliderInput('m', 'Please enter desired forecast period in months', value=1, min=1, max=24, step=1),
		submitButton('Submit')),
	mainPanel(
		h3('Forecast for DJIA'),
		h4('Please note: forecast is provided starting from July 2018 for maximum of 2 years'),
		h4('Average forecast value'),
		verbatimTextOutput("forecast"),
		h4('Prediction Interval'),
		h4('Low 95'),
		verbatimTextOutput("low95"),
		h4('Low 80'),
		verbatimTextOutput("low80"),
		h4('High 80'),
		verbatimTextOutput("high80"),
		h4('High 95'),
		verbatimTextOutput("high95"),		
		plotOutput('fcast')
		)
	)

)