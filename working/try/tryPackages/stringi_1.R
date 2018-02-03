#stringi
##参考URL：https://qiita.com/kohske/items/85d49da04571e9055c44

##パッケージインストール
library('stringi')


##文字列の検索・照合・分割など
###パターン検索
target <- c("迷わず行けよ", "行けばわかるさ", "アリガトー!!")

#行を含む
stri_detect_regex(target, "行")

#先頭に行を含む
stri_detect_regex(target, "^行")

###パターン出現数
stri_count_regex(target, "行")

# "行"または"け"または"ば"
stri_count_regex(target, "[行けば]")

###パターンの出現位置
stri_locate_all_regex(target, "行けば")

# "行"または"け"または"ば"
stri_locate_all_regex(target, "[行けば]")

# 最初の"行"または"け"または"ば"
stri_locate_first_regex(target, "[行けば]")



##パターンの抽出
# "行けば"
stri_extract_all_regex(target, "行けば")

# "行"または"け"または"ば"
stri_extract_all_regex(target, "[行けば]")

# 最初の"行"または"け"または"ば"
stri_extract_first_regex(target, "[行けば]")


##パターンの抽出（サブグループ含む）
# "行けば"
stri_match_all_regex(target, "行けば")

# "行"と"ば"をサブグループに。
stri_match_all_regex(target, "(行)け(ば)")


##文字列の置換
# 飛べ
stri_replace_all_regex(target, "行け", "飛べ")

# マッチの参照
stri_replace_all_regex(target, "(行け)", "$1$1")


##文字列の分割
stri_split_regex(target, "行")


##パターン一致文字列の抽出
stri_subset_regex(target, "行け")
stri_subset_regex(target, "行けば")


##文字列の結合
## 結合
stri_join(target, "ボンバイエ")
stri_join(target, c("いち","にー","さん、だー"))

## 繰り返し
stri_dup(target, 2)

# 演算子
target %s+% "ボンバオエー"
target %s+% c("いち、","にー、","さん、だー")

# 一つの文字列に
stri_flatten(target)

## 間に文字を挟んで
stri_flatten(target, collapse = "!")


##文字列の置換、反転
# 抽出
stri_sub(target, 2, 4)

# 置換（文字列に破壊的変更が生じます）
target2 <- target
stri_sub(target2, 2, 4) <-  "ぼんばいえー"
target2

# 反転
stri_reverse(target)


##文字列のトリム
# 基本系
target_gomi <-  c("  迷わず行けよ  ", "行けばわかるさ", "アリガトー!!")
stri_trim_both(target_gomi)

# 前だけ
stri_trim_left(target_gomi)

# 詰め物 - byte数でカウント
stri_pad_both(target, 20, "@")

# 分割
stri_wrap(target, 5)


##文字列の長さ
#文字列長を取得
stri_length(target)

#単語数を取得
stri_count_words(target)


##文字列の大文字・小文字変換
#小文字に
target_en = c("Hello", "sTRingi", "worlD")
stri_trans_tolower(target_en)

#大文字に
stri_trans_toupper(target_en)

#単語の先頭だけ大文字に、後は小文字に
stri_trans_totitle(target_en)


##文字列の比較・ソート・重複チェックなど
target_cmpA = "アントニオ猪木"
target_cmpB = "アントキの猪木"

# 色々な比較 - ２つの文字列比較。色々な比較が出来ます。一つ目が大きければ1、小さければ-1、同じなら0です。
stri_cmp(target_cmpA, target_cmpB)
stri_cmp(target_cmpB, target_cmpA)


#同一性の確認
stri_cmp_eq(target_cmpA, target_cmpB)
stri_cmp_eq(target_cmpA, target_cmpA)

# 演算子
target_cmpA %s==% target_cmpB

# 文字列を辞書順に並べた時の順番
stri_order(target)

# 文字列を辞書順にソート
stri_sort(target)

# 重複する文字列を削除
target_duc = c(target, "行けばわかるさ")
stri_unique(target_duc)

# 重複チェック
stri_duplicated(target)

# 重複があるかどうか
stri_duplicated_any(target)

stri_duplicated_any(target_duc)


#Unicode文字列のエスケープ、アンエスケープ
stri_escape_unicode("उ")
stri_unescape_unicode("\\u0909")


##ランダム文字列の生成
#　ランダム文字列生成
stri_rand_strings(2, 20, "[アントニオ猪木]")

# シャッフル
stri_rand_shuffle(target)

# lorem ipsum
stri_rand_lipsum(1)
stri_rand_lipsum(2)


#文字列の統計情報
stri_stats_general(target)


##ベンチマーク
library(microbenchmark)
microbenchmark(grepl("行", target), stri_detect_regex(target, "行"))

tar = stri_rand_strings(10000, 42, "[あ-ん]")
microbenchmark(grepl("いのき", tar), stri_detect_regex(tar, "いのき"))