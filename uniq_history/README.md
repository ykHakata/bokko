# NAME

uniqhistory - `.bash_history` の重複行を削除し、作り変える

# SYNOPSIS

uniqhistory

# DESCRIPTION

```
.bash_history とは UNIX のシェルである bash を使い入力した時のコマンド履歴である。
ターミナルでコマンドを入力するたびに溜まってゆき、同じコマンドを入力の際も
記録されてゆく為、重複したコマンドで肥大してゆく。
.bash_profile に HISTFILESIZE を設定することによりファイルサイズを変更
することができるので、ストレージの圧迫は心配しなくて良いが、
重複した履歴というのは効率は悪い。
HISTCONTROL の値を変更することにより重複はさけられるはずだが、
実際はターミナルのタブを複数使用することが多い為
完全に重複をなくすことができない
(もしかすると可能なやり方があるのかもしれないが...)

現状は気付いた時に手動で UNIX のコマンドの uniq コマンドなどを活用し
重複コマンドを消去しているが、たまにしかやらないので、
毎回やり方を忘れてしまう。

そこで備忘録もかねて、コマンド一発で実行出来るスクリプトを作ってみた。

2017年2月
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
$ ln -s ~/github/bokko/uniq_history/uniqhistory ~/bin/uniqhistory

$ which uniqhistory
/Users/yk/bin/uniqhistory

(実行権限を確認していおく)
$ ls -al
...
lrwxr-xr-x   1 yk  staff      47  1  5 22:21 uniqhistory -> /Users/yk/github/bokko/uniq_history/uniqhistory
...
```

# EXAMPLES

```
(.bash_history ファイルの重複を解消)
$ uniqhistory

(.org はオリジナルのコピー、 .sort は並び替えたもののコピーができる)
$ ls -al ~
...
-rw-------    1 yk    staff   48721  1  5 22:10 .bash_history
-rw-r--r--    1 yk    staff  268306  1  5 22:10 .bash_history.org
-rw-r--r--    1 yk    staff  268306  1  5 22:10 .bash_history.sort
...
(.bash_history は重複が解消されたもので上書きされファイルサイズがすくなくなる)

```

# SEE ALSO

- <http://www.oreilly.co.jp/books/4873112540/> - 入門 bash 第3版
