#!/usr/bin/env python3
import argparse
from pathlib import Path
import sys

parser = argparse.ArgumentParser()
parser.add_argument("img", help="The directory where the images are stored")
parser.add_argument("search", help="Files to be investigated")
args = parser.parse_args()
# 画像ファイル置き場
img_path_dir = Path(args.img)
# 検索対象ファイル置き場
search_path = Path(args.search)
# 画像ファイル置き場を再起的に読み込みすべてのファイル名取得
all_file_list = list(img_path_dir.glob('**/*'))
# ソースコードファイル置き場を再起的に読み込みすべてのファイル名取得
source_code_list = list(search_path.glob('**/*'))
# ファイル総数を記録しておきたい。
img_count = 0
used_img_count = 0
unused_img_count = 0
unused_img_file = []
ds_store_count = 0
ds_store_file = []
all_file_count = len(all_file_list)
for full_path in all_file_list:
    sys.stdout.write(f"\rProgress: {str(img_count)}/{all_file_count}")
    sys.stdout.flush()
    img_count += 1
    # DS_store が存在することがある
    if '.DS_Store' == full_path.name:
        ds_store_count += 1
        ds_store_file.append(str(full_path))
    # 拡張子がないものは無視
    if '' == full_path.suffix:
        continue
    # 検索するテキストを整形したい
    search_text = str(full_path).replace(str(img_path_dir), '')
    # print('search_text:',search_text)
    # 画像ファイルが存在が確認できた数
    link_img_count = 0
    for code_file in source_code_list:
        # 拡張子がないものは無視
        if '' == code_file.suffix:
            continue
        # 対象は html erb rb css js
        if '.html' != code_file.suffix and '.erb' != code_file.suffix and '.rb' != code_file.suffix and '.css' != code_file.suffix and '.json' != code_file.suffix and '.js' != code_file.suffix:
            continue
        with open(code_file.resolve()) as f:
            for i, line in enumerate(f):
                if search_text in line:
                    # print('    File names used:',code_file)
                    # print('        row:',i)
                    # print('        text:',line)
                    link_img_count += 1

    if link_img_count == 0:
        unused_img_count += 1
        unused_img_file.append(str(full_path))
    else:
        used_img_count += 1

print('\n')
print('Number of times the image file is used:',used_img_count)
print('Number of unused image files:',unused_img_count)
if unused_img_count > 0:
    print('unused image files:')
    for name in unused_img_file:
        print(name)
print('Number of image files:',img_count)
print('DS_store of files:',ds_store_count)
if ds_store_count > 0:
    print('DS_store exists:')
    for name in ds_store_file:
        print(name)
