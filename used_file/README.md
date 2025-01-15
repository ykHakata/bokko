# Name

usedfile - 参照されているファイルの状況を調査するスクリプト

## Synopsis

## Description

## Options

## Setup

シンボリックリンクをつかった利用をする場合

実行スクリプト置き場を `~/bin` と仮定し、パスを通しておく

最近の mac は zshell が標準となっているので `zshrc` にパスを通す記述をする事例

記述例

```bash
cat .zshrc
# bin
export PATH=$HOME/bin:$PATH
```

シンボリックリンクを作成 (パスは読み替えてください)

- スクリプト置き場に移動して

```bash
cd ~/bin
```

- シンボリックリンク作成

```bash
ln -s /Users/yk/github/bokko/used_file/usedfile.py usedfile
```

- コマンドが使えることを確認

```bash
which usedfile
/Users/yk/bin/usedfile
```

## Examples

フルパスで指定

usedfile '/Users/yk/tmp/img' '/Users/yk/tmp/lib'

## See also

## History
