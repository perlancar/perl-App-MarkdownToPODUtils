package App::MarkdownUtils;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our %SPEC;

$SPEC{markdown_to_pod} = {
    v => 1.1,
    summary => 'Convert Markdown to POD',
    description => <<'_',

Currently using `Markdown::To::POD` perl module.

_
    args => {
        markdown => {
            schema => 'str*',
            cmdline_src => 'stdin_or_files',
            req => 1,
            pos => 0,
        },
    },
};
sub markdown_to_pod {
    require Markdown::To::POD;

    my %args = @_;

    my $pod = Markdown::To::POD::markdown_to_pod($args{markdown});

    [200, "OK", $pod];
}

$SPEC{markdown_to_html} = {
    v => 1.1,
    summary => 'Convert Markdown to HTML',
    description => <<'_',

Currently using `Text::Markdown` perl module.

_
    args => {
        markdown => {
            schema => 'str*',
            cmdline_src => 'stdin_or_files',
            req => 1,
            pos => 0,
        },
    },
};
sub markdown_to_html {
    require Text::Markdown;

    my %args = @_;

    my $html = Text::Markdown::markdown($args{markdown});

    [200, "OK", $html];
}

1;
# ABSTRACT: Collection of CLI utilities related to Markdown

=head1 DESCRIPTION

This distribution provides the following command-line utilities related to
Markdown:

#INSERT_EXECS_LIST


=head1 SEE ALSO

L<App::CommonMarkUtils>

=cut
