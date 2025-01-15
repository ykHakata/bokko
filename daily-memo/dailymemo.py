#!/usr/bin/env python3
import argparse
import datetime
parser = argparse.ArgumentParser()
parser.add_argument("-d","--date", help="Specifying a date")
args = parser.parse_args()

# 曜日の設定
WEEKDAY = ['(月)', '(火)', '(水)', '(木)', '(金)', '(土)', '(日)']

# テキスト形式を整えておく
def format_sub(date):
    return f'{date.isoformat()} {WEEKDAY[date.weekday()]}'

# 入力される日付テキストのバリデートは考えておきたい

# 作成を始める日付
start_date = datetime.date.fromisoformat('2024-10-01')
# 作成を終了する日付
end_date = datetime.date.fromisoformat('2024-10-20')
# 設定された日付の整合性は確かめておきたい
if start_date < end_date:
    print('if------')
else:
    # 終了
    print('else------')

# 日付のテキストを配列で保存しておく
date_list = (format_sub(end_date),)
# 始める日付から1日ずつ進めて、終了する日付になったら終了
# 終了する日付から1日ずつもどって、始める日付になったら終了
while True:
    end_date = end_date - datetime.timedelta(days=1)
    if start_date < end_date:
        date_list += (format_sub(end_date),)
    else:
        # 終了
        date_list += (format_sub(start_date),)
        break

# 出力日付情報と整える
# print(year)
output = f'''# {end_date.year}

{end_date.year} のメモ

'''
temple = '''
```md
```
'''
for date in date_list:
    output += f'## {date}\n{temple}\n'

# ページの下の方に加える
output += f'''## todo
{temple}'''

# 画面出力で終了
# print('output',output)
print(output)


# # 今の西暦
# now_dt = datetime.datetime.now()
# year = now_dt.year
# mon = 1
# day = 1
# if args.date:
#     print(args.date)
#     # year = int()
#     # mon = 1
#     # day = 1

# # 出力したいテキスト
# past_date = datetime.date(year, mon, day)
# content = '```md\n```'
# start_date_title = '\n\n## ' + past_date.isoformat() + f' ({WEEKDAY[past_date.weekday()]})\n\n'
# output_text = start_date_title + content

# for i in range(365):
#     past_date = past_date + datetime.timedelta(days=1)
#     date_title = '\n\n## ' + past_date.isoformat() + f' {WEEKDAY[past_date.weekday()]}\n\n'
#     output_text = date_title + content + output_text

# # 最後にタイトルを加えておきたい。
# title = f'# {year}\n\nsample text'
# output_text = title + output_text

# print(output_text)
