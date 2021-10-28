# from time import gmtime
import time
import argparse
# parser = argparse.ArgumentParser()
# parser.parse_args()
# parser = argparse.ArgumentParser()
# parser.add_argument("echo", help="echo the string you use here")
# args = parser.parse_args()
# print(args.echo)

parser = argparse.ArgumentParser()
parser.add_argument(
    "square", help="display a square of a given number", type=int)
args = parser.parse_args()
print(args.square**2)


print('uns!')
# epoc = gmtime()
epoc = time.time()
print(int(epoc))

# ファイル名にエポック秒がついたファイル名が作成される
# uns 'lp-food.jpeg'
# > ok 'lp-food-8769876.jpeg'
# オプションをつけるとファイルを置き換える動作も加えたい
