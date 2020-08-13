package Makechapter::CLI;
use strict;
use warnings;
use utf8;
use Getopt::Long;
use Makechapter::Builder;
use Data::Dumper;
use parent qw(Makechapter);

sub run {
    my ( $self, @args, ) = @_;

    my $project    = "project";
    my $chapter    = 5;
    my $section    = 3;
    my $subsection = 3;
    GetOptions(
        "project=s"    => \$project,
        "chapter=i"    => \$chapter,
        "section=i"    => \$section,
        "subsection=i" => \$subsection,
    ) or die("Error in command line arguments\n");
    my $params = +{
        project    => $project,
        chapter    => $chapter,
        section    => $section,
        subsection => $subsection,
    };
    my $builder = Makechapter::Builder->new($params);
    $builder->start;
    return 1;
}

1
