# NAME

    dayrepo - daily report 日報のひな形出力

# SYNOPSIS

    dayrepo [date] > file

# DESCRIPTION

    長らく愛用してきた dateMemo.pl だが使っていくうちに問題点がいろいろ出てきた
    出力したい月を設定するのにソースコードを直接書き換えないといけない
    Calendar::Simple に依存している
    実行するのにフルパスで指定しなければいけない
    テンプレートの雛形も変更したくなってきた
    2016年3月頃に、全面的に作り変えようとするも考えがまとまらず放置されていた
    今回は名前も dateMemo から daily report とし、実行ファイルもタイプしやすく
    dayrepo という名前に変更し手軽に使えるように刷新した

    2017年3月

# EXAMPLES

```bash
# 標準出力へ (実行した月の頭から月末まで出力)
$ dayrepo

# 指定したファイルに書き出し
$ dayrepo > ~/2017_03.md

# 作成する日時を指定
$ dayrepo 2017-04-01 > ~/2017_04.md

# 任意の日付の場合、指定日から月末まで出力
$ dayrepo 2017-05-16 > ~/2017_05.md
```

# SEE ALSO

# HISTORY
