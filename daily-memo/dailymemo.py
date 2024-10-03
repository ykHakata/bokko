#!/usr/bin/env python3
import argparse
import datetime
parser = argparse.ArgumentParser()
parser.add_argument("-d","--date", help="Specifying a date")
args = parser.parse_args()

# 曜日の設定
WEEKDAY = ['(月)', '(火)', '(水)', '(木)', '(金)', '(土)', '(日)']

# 今の西暦
now_dt = datetime.datetime.now()
year = now_dt.year
mon = 1
day = 1
if args.date:
    print(args.date)
    # year = int()
    # mon = 1
    # day = 1

# 出力したいテキスト
past_date = datetime.date(year, mon, day)
content = '```md\n```'
start_date_title = '\n\n## ' + past_date.isoformat() + f' ({WEEKDAY[past_date.weekday()]})\n\n'
output_text = start_date_title + content

for i in range(365):
    past_date = past_date + datetime.timedelta(days=1)
    date_title = '\n\n## ' + past_date.isoformat() + f' {WEEKDAY[past_date.weekday()]}\n\n'
    output_text = date_title + content + output_text

# 最後にタイトルを加えておきたい。
title = f'# {year}\n\nsample text'
output_text = title + output_text

print(output_text)
