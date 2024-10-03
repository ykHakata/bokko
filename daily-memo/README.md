# NAME

dailymemo - daily memo 日々のメモ

毎日の記録

## SYNOPSIS

```bash
dailymemo [--date=<date>]
```

## DESCRIPTION

いつのまにか使わなくなった dayrepo だが取り巻く状況が変化し、フォーマットもシンプルなものに落ち着いてきた。

フォーマットの改定

- 記載の日付の順番、古い物が下に来る
- 1年を1つのファイルにする
- 年、月、日、の三段構成
- 1番したのところに todo 項目追加
- 1日分の項目の中をシンプルで汎用的に

## OPTIONS

```text
--data=<date> or -d=<date>
    date 形式で日付を指定してください、指定した日付から年末までを出力します
    入力例は EXAMPLES を参照
```

## SETUP

パスの通った起動ファイルを置く場所をすでにお持ちの方

ホームディレクトリ配下 bin ディレクトリを起動ファイルの置き場にしている場合

```bash
cd ~/bin
```

シンボリックリンクを作成 (パスは読み替えてください)

```bash
ln -s /Users/yk/github/bokko/daily-memo/dailymemo.py dailymemo
```

## EXAMPLES

```bash
# 標準出力へ年始から年末まで出力)
dailymemo

# 指定したファイルに書き出し
dailymemo > ~/2024.md

# 作成を始める日時を指定
dailymemo -d 2024-04-01 > ~/2024_04.md

# 任意の日付の場合、指定日から年末まで出力
dailymemo --date=2024-05-16 > ~/2024_05.md
```
