# NAME

makechapter - 章立ての記事を書くためのディレクトリ構造の構築(Perl版)

# SYNOPSIS

```
$ makechapter2
```

# DESCRIPTION

```
makechapter を Perl を使って機能を充実させた
章,節,項 と自由度を高めた
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
$ ln -s ~/github/bokko/make_chapter/perl/makechapter ~/bin/makechapter2

$ which makechapter2
/Users/yk/bin/makechapter2

(実行権限を確認しておく)
$ ls -al
...
lrwxr-xr-x   1 yk  staff       47  1 24 15:31 makechapter2 -> /Users/yk/github/bokko/make_chapter/perl/makechapter
...
```

もし実行権限がない場合は実行権限をつける

```
$ chmod a+x makechapter
```

# EXAMPLES

```
```

# SEE ALSO

-
