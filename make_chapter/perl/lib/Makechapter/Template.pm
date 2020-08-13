package Makechapter::Template;
use strict;
use warnings;
use utf8;
use parent qw(Makechapter);
use Data::Dumper;
use File::Basename;

sub write {
    my $self = shift;
    warn 'write------1';

    my $index = $self->get_params;
    warn Dumper $index;
    my $project_title = $index->{params}->{project};

    my $path_list = $index->{path_list};

    my $text_project    = $self->_write_project( $project_title, $path_list );
    my $text_chapter    = $self->_write_chapter($path_list);
    my $text_section    = $self->_write_section();
    my $text_subsection = $self->_write_subsection();

    warn $text_project;
    warn $text_chapter;
    warn $text_section;
    warn $text_subsection;

    return;
}

sub _menu_bar {
    my $self      = shift;
    my $path_list = shift;
    my $menu_bar  = '';
    for my $path ( @{$path_list} ) {
        my @dirs       = File::Spec->splitdir($path);
        my $link_title = basename($path);
        my $add_text   = '';

        if ( scalar @dirs eq 1 ) {
            my $text = shift @dirs;
            $add_text = "- $text:";
        }
        if ( scalar @dirs eq 2 ) {
            shift @dirs;
            my $path = File::Spec->catdir(@dirs);
            $add_text = "  - [$link_title]($path):";
        }
        if ( scalar @dirs eq 3 ) {
            shift @dirs;
            my $path = File::Spec->catdir(@dirs);
            $add_text = "    - [$link_title]($path):";
        }
        if ( scalar @dirs eq 4 ) {
            shift @dirs;
            my $path = File::Spec->catdir(@dirs);
            $add_text = "      - [$link_title]($path):";
        }
        $menu_bar .= <<"__END2__";
$add_text
__END2__
    }
    return $menu_bar;
}

sub _write_project {
    my $self      = shift;
    my $title     = shift;
    my $path_list = shift;

    my $readme = <<"__END_TEXT__";
# NAME

$title -

# INTRODUCTION

```
```

# MENU
__END_TEXT__
    $readme .= $self->_menu_bar($path_list);
    $readme .= <<"__END_TEXT__";

# SUMMARY

# SEE ALSO

__END_TEXT__
    return $readme;
}

sub _write_chapter {
    my $self      = shift;
    my $path_list = shift;
    my $title = '';
    for my $path ( @{$path_list} ) {
        my @dirs       = File::Spec->splitdir($path);
        if ( scalar @dirs eq 2 ) {
            $title = basename($path);
        }
    }

    my $readme = <<"__END__";
# NAME

$title -

```
```

# SUMMARY

# SEE ALSO

__END__
    return $readme;

}

sub _write_section {
    my $self   = shift;
    my $readme = <<"__END__";
# NAME

# INTRODUCTION

```
```

# MENU

# SUMMARY

# SEE ALSO

__END__
    return $readme;
}

sub _write_subsection {
    my $self   = shift;
    my $readme = <<"__END__";
# NAME

# INTRODUCTION

```
```

# MENU

# SUMMARY

# SEE ALSO

__END__
    return $readme;
}

1;
__END__
