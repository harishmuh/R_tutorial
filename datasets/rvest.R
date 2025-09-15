library(rvest)
lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")

cast <- html_nodes(lego_movie, ".primary_photo+ td a")

html_text(cast, trim = TRUE)
