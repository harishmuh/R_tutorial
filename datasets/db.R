library(DBI)
# Create an in-memory RSQLite database
con <- dbConnect(RSQLite::SQLite(), ":memory:")

#List the tables in the databases
dbListTables(con)

# write the dataset mtcars in the database 
dbWriteTable(con, "mtcars", mtcars)

#List the tables in the databases
dbListTables(con)

#List the fields in the mtcars table
dbListFields(con, "mtcars")

#Read the table
dbReadTable(con, "mtcars")

#Query the table mtcars
dbGetQuery(con, "SELECT * from mtcars")

#Query specific columns in the table mtcars
dbGetQuery(con, "SELECT mpg, cyl, wt from mtcars")

#Query the table with some condition
dbGetQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")

####### MS SQL SERVER ##############

#Code to connect to a MS SQL Server
con <- DBI::dbConnect(odbc::odbc(),
                      Driver   = "[your driver's name]",
                      Server   = "[your server's path]",
                      Database = "[your database's name]",
                      UID      = rstudioapi::askForPassword("Database user"),
                      PWD      = rstudioapi::askForPassword("Database password"),
                      Port     = 1433)

#The following code shows how to connect to a local MS SQL Express instance
con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server = "localhost\\SQLEXPRESS", 
                      Database = "master", 
                      Trusted_Connection = "True")

####### MySQL #################

# Code to connect to a MySQL database
con <- DBI::dbConnect(odbc::odbc(),
                      Driver   = "[your driver's name]",
                      Server   = "[your server's path]",
                      UID      = rstudioapi::askForPassword("Database user"),
                      PWD      = rstudioapi::askForPassword("Database password"),
                      Port     = 3306)

# You need to install the RMariaDB package.
#install.packages("RMariaDB")
