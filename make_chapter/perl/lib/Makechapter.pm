package Makechapter;
use strict;
use warnings;
use utf8;
use Data::Dumper;

sub new {
    my $class  = shift;
    my $params = shift || +{};
    return bless $params, $class;
}

sub hello {
    my $self = shift;
    return print 'Makechapter!!';
}

sub get_params {
    my $self   = shift;
    my $params = +{};
    for my $key ( sort( keys %{$self} ) ) {
        $params->{$key} = $self->{$key};
    }
    return $params;
}

sub create_dir {
    my ( $self, $dir, $title, $numbers, ) = @_;
    my $dirs = [];
    for my $i ( @{$numbers} ) {
        my $create_dir = "$title$i";
        my $mk_dir     = "$dir/$create_dir";
        mkdir $mk_dir;
        push @{$dirs}, $mk_dir;
    }
    return $dirs;
}

1;
__END__
