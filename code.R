
library(tseries)
library(forecast)
library(quantmod)
 
 # Define the stock symbol and data source
 symbol <- "TATASTEEL.NS"
 src <- "yahoo"
 
 # Download the historical data and assign it to a variable
 TS <- getSymbols(symbol, src = src, auto.assign = TRUE)
stock_ts <- ts(TATASTEEL.NS$TATASTEEL.NS.Close, frequency = 252)
 any(is.na(stock_ts))   # Check for missing values
 library(zoo)
 s<-na.approx(stock_ts)
 adf.test(s)
diff_ts <- diff(stock_ts)
Box.test(diff_ts, lag = 20, type = "Ljung-Box")

	Box-Ljung test

data:  diff_ts
X-squared = 74.364, df = 20, p-value = 3.476e-08
 
 arima_model <- auto.arima(diff_ts)
 
 summary(arima_model)
Series: diff_ts 
ARIMA(0,0,0) with zero mean 

sigma^2 = 2.299:  log likelihood = -7410.83
AIC=14823.66   AICc=14823.66   BIC=14829.97

Training set error measures:
                     ME     RMSE      MAE MPE MAPE     MASE       ACF1
		     	
 forecast_values <- forecast(arima_model, h = 30)
 
 View(forecast_values)
 autoplot(forecast_values)
 
 forecast_values2 <- forecast(arima_model, h = 100)
 
 autoplot(forecast_values2)
