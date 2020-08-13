package Makechapter::Dir;
use strict;
use warnings;
use utf8;
use parent qw(Makechapter);
use Data::Dumper;
use File::Spec;

# index から dir を作成
sub create {
    my $self = shift;
    warn 'create------1';
    my $index = $self->get_params;
    for my $path ( @{ $index->{path_list} } ) {
        mkdir $path;
    }
    return 1;
}

1;
__END__
