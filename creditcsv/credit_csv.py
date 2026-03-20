#!/usr/bin/env python3
import argparse


def start():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-t",
        "--type",
        choices=["kv", "rv"],
        default="kv",
        help="Specify the credit card company that provides the CSV file you want to format.",
    )
    parser.add_argument(
        "-j", "--json", action="store_true", help="Output in json format."
    )
    parser.add_argument("file", default=42, help="Specify the csv file you want to read.")
    args = parser.parse_args()
    print(args)
    parser.print_help()


# 九州カード visa の時のファイル取り込みから成形まで


# 楽天カード visa の時のファイル取り込みから成形まで


if __name__ == "__main__":
    start()

# print(args)

# import csv
# import pprint
# import chardet

# # 文字コードがutf-8ではない
# # {'encoding': 'SHIFT_JIS', 'confidence': 0.2861394557823129, 'language': 'Japanese'}
# # encode = "cp932"
# # encode = "utf_8"
# encode = "utf-8-sig"
# # file_path = 'data/202506.csv'
# file_path = 'data/enavi202508(8230).csv'
# with open(file_path, 'r', encoding=encode) as f:
# # with open('data/202506.csv', mode='rb') as f:
#     # # print(f.read())
#     # c = f.read()
#     # result = chardet.detect(c)
#     # print(result)
#     reader = csv.reader(f)
#     for row in reader:
#         print(row)


#     # >>> chardet.detect(rawdata)
#     # print(result)
