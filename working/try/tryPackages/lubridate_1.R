#lubridateパッケージ入門
#参考URL：https://qiita.com/nozma/items/01725761d980a0110027

#データの読み込み
sample <- read.csv("/Users/matsumotoyoshishi/git/ForPersonal/working/shakyo/楽しいR/sampledata/sample.txt",sep="\t", header = T)

#library読み込み
library("lubridate")

##データの操作-基本のパース
ymd("20110511")
mdy("05-11-2011")
dmy("11-05-2011")


##時刻情報
Sys.setenv(TZ="Asia/Tokyo") 
ymd_hms("2011-05-11 12:00:00",tz="Asia/Tokyo")

##情報の代入と抽出
###パラメータ：second minute hour day wday yday week month year tz
arrive <- ymd_hms("2018-02-02 15:57:20", tz = "Asia/Tokyo")
second(arrive) <- 50
second(arrive)

wday(arrive)
wday(arrive, label = T)
month(arrive)
month(arrive, label = T)

##インターバル
arrive <- ymd_hms("2018-02-02 15:57:20", tz = "Asia/Tokyo")
leave <- mdy_hms("05-07-2018 20:05:22", tz = "Asia/Tokyo")
intervalTime <- interval(arrive, leave)

###演算子を使ってインターバルを表現
arrive %--% leave

###2つのインターバルに時期的な重なりがあるかどうかを確認する = int_overlaps
intervalTime2 <- interval(ymd("2017-05-11", tz = "Asia/Tokyo"), ymd("2018-02-03", tz ="Asia/Tokyo"))
int_overlaps (intervalTime, intervalTime2)

##日付の計算
minutes(2)

###時間間隔に関するクラス：durations ←頭にdをつける
####durationsにおける1年は常に365日
dyears(2)
dminutes(2)

ymd("2015-09-02") + years(1)
ymd("2015-09-02") + dyears(1)

###時間間隔に関するクラス：periods
####periodsにおける1年はうるう年では366日
oneday <- ymd("2022-02-18")
oneday2 <- mdy("05-25-2023")
intervaltime3 <- interval(oneday, oneday2)
intervaltime3 / ddays(1)
intervaltime3 / months(1)

as.period(intervaltime3 / months(1))
as.duration(intervalTime / month(1))

##現在の日付、時刻の取得
date()
Sys.Date()
today()
now()
