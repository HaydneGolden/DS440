library(shiny)
library(odbc)
library(config)
library(DBI)

con <- dbConnect(drv = odbc::odbc(),
                 Driver = "SQL Server",
                 server = "vaccineio.database.windows.net,1433",
                 database = "vaccine",
                 uid = "vaccine",
                 pwd = "DS440Project")

