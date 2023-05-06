
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
 
 arima_model <- auto.arima(diff_ts)
 
 summary(arima_model)

 forecast_values <- forecast(arima_model, h = 30)
 
 View(forecast_values)
 autoplot(forecast_values)
 
 forecast_values2 <- forecast(arima_model, h = 100)
 
 autoplot(forecast_values2)
