package Makechapter::Index;
use strict;
use warnings;
use utf8;
use parent qw(Makechapter);
use Data::Dumper;
use File::Spec;

sub make {
    my $self   = shift;
    my $params = $self->get_params;

    my $chapter_max    = $params->{chapter};
    my $section_max    = $params->{section};
    my $subsection_max = $params->{subsection};
    my $path_list      = [];
    my $p_path         = File::Spec->catdir( $params->{project} );
    push @{$path_list}, $p_path;
    for my $chapter_i ( 1 .. $chapter_max ) {
        my $c_dir  = 'chapter' . $chapter_i;
        my $c_path = File::Spec->catdir( $p_path, $c_dir );
        push @{$path_list}, $c_path;
        for my $section_i ( 1 .. $section_max ) {
            my $s_dir  = 'section' . $section_i;
            my $s_path = File::Spec->catdir( $p_path, $c_dir, $s_dir );
            push @{$path_list}, $s_path;
            for my $subsection_i ( 1 .. $subsection_max ) {
                my $sub_dir = 'subsection' . $subsection_i;
                my $sub_path
                    = File::Spec->catdir( $p_path, $c_dir, $s_dir, $sub_dir );
                push @{$path_list}, $sub_path;
            }
        }
    }
    my $index = +{
        path_list => $path_list,
        params    => $params,
    };
    return $index;
}

1;
__END__
