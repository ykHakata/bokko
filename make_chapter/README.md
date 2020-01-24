# NAME

makechapter - 章立ての記事を書くためのディレクトリ構造の構築

# SYNOPSIS

```
$ export CREATE_DIR="$(pwd)/started_docker" && makechapter
```

# DESCRIPTION

```
書籍の原稿にしやすい形に記事を書くことを考えると章立てが都合がいいので
github のリポジトリでサンプルコードを一緒に管理するための
ディレクトリ構造を一気に作成するスクリプトをつくった

本当は
$ makechapter --path "$(pwd)/started_docker"
のように作りたかったので課題としてのこしておく

2020年1月
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
$ ln -s ~/github/bokko/make_chapter/makechapter ~/bin/makechapter

$ which makechapter
/Users/yk/bin/makechapter

(実行権限を確認していおく)
$ ls -al
...
lrwxr-xr-x   1 yk  staff       47  1 24 15:31 makechapter -> /Users/yk/github/bokko/make_chapter/makechapter
...
```

もし実行権限がない場合は実行権限をつける

```
$ chmod a+x makechapter
```

# EXAMPLES

```
(started_docker という名前のリポジトリ管理前提のディレクトリ構造をつくりたい)
$ export CREATE_DIR="$(pwd)/started_docker" && makechapter

(.org はオリジナルのコピー、 .sort は並び替えたもののコピーができる)
$ ls -al ~
...
-rw-------    1 yk    staff   48721  1  5 22:10 .bash_history
-rw-r--r--    1 yk    staff  268306  1  5 22:10 .bash_history.org
-rw-r--r--    1 yk    staff  268306  1  5 22:10 .bash_history.sort
...
```

# SEE ALSO

-
