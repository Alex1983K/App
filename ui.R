shinyUI(pageWithSidebar(
	headerPanel("Forecasting Dow Jones Industrial Average Index"),
	sidebarPanel(
		sliderInput('m', 'Please enter desired forecast period in months', value=1, min=1, max=24, step=1),
		submitButton('Submit')),
	mainPanel(
		tabsetPanel(type="tabs",		
			tabPanel("DJIA", br(),
				h3('Forecast for DJIA'),
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
				plotOutput('fcast')),
			tabPanel("How to Use DJIA App", br(),
				h3('Supporting Documentation: Forecasting Dow Jones Industrial Average Index - Shiny App'),
				h4('Alexander Kuznetsov'),
				h4('07/27/2018'),
				h4('Introduction'),
				h5('Hello, thank you for using DJIA app!
				Dow Jones Industrial Average (DJIA) index is a stock market index tracking 30 largest public corporations in US. It includes companies like Apple, IBM, 				Intel, Microsoft. This index is a benchmark of US and global economy. If you are interested in learning more, please follow this Wikipedia page link 				below:'), tags$a(href="http://en.wikipedia.org/wiki/Dow_Jones_Industrial_Average", "Wikipedia article about DJIA"),		
				h5('This app, developed with Shiny package, is intended to assist in forecasting the Dow Jones index.'), 
				h5('GitHub repository with code can be accessed through link below:'),
				tags$a(href="http://github.com/Alex1983K/App", "App code"), 
				h5('R packages used for the app are "quantmod", "ggplot2" and "forecast".'),
				h4('How to use DJIA app'),
				h5('The app is designed to perform time series forecast of Dow Jones Industrial Average index for maximum of two years starting from July 2018. The input 					required from user is desired number of months to predict DJIA index. This number can be input using a slider choosing between 1 month and 24 months. Please 					press "Submit" button after selecting number of months for forecast. App automatically downloads historical data for DJIA index starting from March 1, 2007 					using "quantmod" package. Therefore, it may take few seconds for app to load and become fully operational. This would largely depend on your broadband and 					your computer processing speed. Thank you for your patience and I apologize for any inconvenience. I would recommend to wait until chart of the index is 					displayed on the bottom of the page before using the app.'),
				h4('Interpreting the output'),
				h5('App converts data into month period time series and uses exponential smoothing to build a predictive model. The output is average forecast number and 					prediction interval consisting of 4 values: "Low 95", "Low 80", "High 80" and "High 95". Average forecast value is predicted value for DJIA index to be 					around at selected time from now. You can expect DJIA index to be fluctuating around the average forecast value over the period of time of your prediction 					timeframe.'),
				h5('Prediction interval shows range of the index values to occur with 80% and 95% probability. For example, there is 80% chance that DJIA index will be in 				the range between "Low 80" and "High 80" at the end of prediction time period.'), 
				h5('Finally, DJIA index chart is displayed on the bottom of the page showing closing monthly index values starting from March 1, 2007. It is also supposed to 				display forecast values of the index with average forecast value being shown as blue line. 80% and 95% prediction intervals are shown as blue shades 						around 	the forecast line. You can expect to see DJIA index in these intervals with 80% and 95% chances respectively. I hope you have fun using this 						app.'),
				h5('Thank you!')
				)
			)
		)
	)
)