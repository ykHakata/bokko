use strict;
use warnings;
use utf8;
use IO::File;
use Data::Dumper;

binmode STDOUT, ':encoding(utf-8)';

my $file = shift @ARGV;

my $fh = IO::File->new( $file, '<:encoding(utf-8)' )
    or die "Can't open $file: $!";

my $text = do { local $/; <$fh> };

# テキストデーターをスプリットで区切り、日報の部分だけ抽出
my $summary = '';
for my $date ( split '<!-- SPLIT DATE -->', $text ) {
    my ( $title, $report, $memo, ) = split '<!-- SPLIT -->', $date;

    if ( $title && $report ) {
        $summary .= $title . $report;
    }

    if ( !$title && $report) {
        $summary .=  $report;
    }

    if ( $title && !$report) {
        $summary .=  $title;
    }
}

$fh->close;

# 日報の部分をまとめたテキストを標準出力へ書き出し
print $summary;
