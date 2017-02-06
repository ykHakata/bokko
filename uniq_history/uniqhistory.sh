#!/bin/bash
##############################################################################
# Name: uniqhistory
# Description: .bash_history の重複行を削除し、作り変える
# Usage: uniqhistory
# Author: yukio kusakabe
# Date: 2017-02-05
##############################################################################

# bash_history をバックアップ用ファイルに追記保存
cat ~/.bash_history >> ~/.bash_history.org

# ファイルの中身をソート
sort ~/.bash_history > ~/.bash_history.sort

# 重複削除
uniq ~/.bash_history.sort ~/.bash_history
