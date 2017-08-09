# NAME

dayrepo - daily report 日報のひな形出力

# SYNOPSIS

```
dayrepo [--date=<date>]
```

# DESCRIPTION

```
長らく愛用してきた dateMemo.pl だが使っていくうちに問題点がいろいろ出てきた
出力したい月を設定するのにソースコードを直接書き換えないといけない
Calendar::Simple に依存している
実行するのにフルパスで指定しなければいけない
テンプレートの雛形も変更したくなってきた
2016年3月頃に、全面的に作り変えようとするも考えがまとまらず放置されていた
今回は名前も dateMemo から daily report とし、実行ファイルもタイプしやすく
dayrepo という名前に変更し手軽に使えるように刷新した

2017年3月
```

# OPTIONS

```
--data=<date> or -d=<date>
    date 形式で日付を指定してください、指定した日付から月末までを出力します
    入力例は EXAMPLES を参照ください
```

# SETUP

パスの通った起動ファイルを置く場所をすでにお持ちの方

```
(ホームディレクトリ配下 bin ディレクトリを起動ファイルの置き場にしている)
$ echo $PATH
/Users/yk/bin: ... (省略)
```

シンボリックリンクを作成 (パスは読み替えてください)

```
$ pwd
/Users/yk/bin

(シンボリックリンク作成)
$ ln -s /Users/yk/github/bokko/daily_report/dayrepo dayrepo

$ which dayrepo
/Users/yk/bin/dayrepo

(実行権限を確認していおく)
$ ls -al
...
lrwxr-xr-x   1 yk  staff    43  8  9 11:54 dayrepo -> /Users/yk/github/bokko/daily_report/dayrepo
...
```

# EXAMPLES

```
(標準出力へ 実行した月の頭から月末まで出力)
$ dayrepo

(指定したファイルに書き出し)
$ dayrepo > ~/2017_03.md

(作成する日時を指定)
$ dayrepo -d 2017-04-01 > ~/2017_04.md

(任意の日付の場合、指定日から月末まで出力)
$ dayrepo --date=2017-05-16 > ~/2017_05.md
```


# SEE ALSO

# HISTORY
