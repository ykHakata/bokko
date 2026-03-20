# credit-csv

creditcsv - クレジットカード会社が提供しているcsvファイルを成形

## SYNOPSIS

```bash
creditcsv [--type=<name>] [--json] [file ...]
```

## DESCRIPTION

```text
最近はクレジットカード各社が利用履歴をwebサイト確認できようになり
csv形式のテキストファイルのダウンロードを提供してくれるようになった

しかし、各社ダウンロードファイルの文字コードが統一されていなかったり
行と列の形式ではなかったりと使い勝手が悪い

利用履歴でデータを収集したいモチベーションは履歴データをもとに
絞り込み検索などを使いたいため、行と列の形式に置き換え DB に取り込めるようにしたい

2025年9月
```

## OPTIONS

```text
--type=<name> or -t=<name>
    整形したいcsv形式ファイルを提供している、クレジットカード会社を指定
    "kv" 九州カードvisa, "rv" 楽天カードvisa
    入力例は EXAMPLES を参照ください

--json or -j
    json 形式で出力します
```

## EXAMPLES

```text
creditcsv --type="kv" 202506.csv
    標準出力へ、文字コードはutf8、行の形式に成形

creditcsv 202506.csv
    type を省略した場合は kv が選択

creditcsv --type="kv" 202506.csv > 202506_after.csv
    指定したファイルに書き出し

creditcsv --type="kv" --json 202506.csv
    json 形式で出力
```

作成予定memo

- クレジットカード利用履歴のデータベース化
  - カード会社のcsv形式ファイル取り込み
  - データの成形
  - 成形後のcsvデータ書き出し
  - 成形後データをデータベースに書き込み
- クレジットカード残高照合
  - カード利用履歴の絞り込み検索機能
  - 絞り込み結果をテキストファイル書き出し
  - 絞り込み検索結果の利用履歴をcsv形式でのファイル書き出し
- クレジットカード各社に対応
  - 九州カード(visa)の場合
  - ミライカード(master)の場合
  - 楽天カード(visa)の場合

```bash
# 初動の venv 環境準備
python3 -m venv .venv

# (有効化)
source .venv/bin/activate

# (終了するときは無効化)
(.env) % deactivate

# 仮想環境を使用中にモジュールインストール
(.venv) % python3 -m pip install chardet

# (インストール後は履歴を取っておく)
(venv) % python3 -m pip freeze >> requirements.txt

# (再現インストール)
(venv) % python3 -m pip install -r requirements.txt

# (実行)
(venv) % ./credit_csv.py

# venv 環境が構築されていれば下記でも実行可能
.venv/bin/python3 credit_csv.py

.venv/bin/python3 -m unittest
```
