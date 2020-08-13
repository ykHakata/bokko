package Makechapter::Builder;
use strict;
use warnings;
use utf8;
use parent qw(Makechapter);
use Makechapter::Index;
use Makechapter::Dir;
use Makechapter::Template;
use Makechapter::File;
use Data::Dumper;

sub start {
    my $self = shift;
    warn 'start-----1';
    my $params = $self->get_params;

    warn 'start-----2';
    # 構築する階層のデータ構造
    my $index = Makechapter::Index->new($params)->make;
    # warn Dumper $index;

    # ディレクトリ作成
    Makechapter::Dir->new($index)->create;

    # readme ファイルの文面作成
    my $template_params = Makechapter::Template->new($index)->write;

    # readme ファイル作成
    my $file = Makechapter::File->new($template_params)->create;
    return 1;
}

1;
__END__
