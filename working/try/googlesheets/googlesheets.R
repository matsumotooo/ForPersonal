#参考資料
https://github.com/jennybc/googlesheets#google-sheets-r-api

#libralyの読み込み
library("googlesheets")

#スプレッドシートの読み込み
gap <- gs_title("readtest")
gap
gap %>% gs_browse(ws = "sheet2")
data <- gap %>% gs_read(ws = "sheet1", range = "A1:C29")
