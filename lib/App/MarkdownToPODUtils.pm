package App::MarkdownToPODUtils;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our %SPEC;

$SPEC{markdown_to_pod} = {
    v => 1.1,
    summary => 'Convert Markdown to POD',
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

1;
# ABSTRACT: Collection of CLI utilities related to converting Markdown to POD

=head1 DESCRIPTION

This distribution provides the following command-line utilities related to
converting Markdown to POD:

#INSERT_EXECS_LIST

=cut
