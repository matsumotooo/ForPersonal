#twitterのタイムラインを取得
##library読み込み
library(ROAuth)
library(twitteR)
library(base64enc)

##情報の入力
consumerKey    <- "{consumerKeyを入力}"
consumerSecret <- "{consumerSecretを入力}"
accessToken    <- "{accessTokenを入力}"
accessSecret   <- "{accessSecretを入力}"

##httr_oauth_chcheを保存
options(httr_oauth_cache = TRUE)
##認証情報の取得
setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessSecret)

##ユーザーのタイムラインを取得
SearchWords <- c("#統計")


##検索
TwGetDF <- twListToDF(searchTwitter(SearchWords,since = NULL, until = NULL, n = 3000))

##結果
TwGetDF