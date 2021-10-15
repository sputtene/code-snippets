#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: template_toolkit_and_DATA.pl
#
#        USAGE: ./template_toolkit_and_DATA.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 08/02/2021 11:57:59 AM
#     REVISION: ---
#===============================================================================

package TT2::RenderTest;

use strict;
use warnings;
use utf8;

use v5.10;

use Template;
use Data::Section -setup => { default_name => 'default_section' };
use Data::Dumper;


sub main {
    my $templates = __PACKAGE__->merged_section_data;

    my $tt = Template->new({
            BLOCKS      => $templates,
            TRIM        => 1,
    });

    my $vars = {
        subsection  => 'block_b',
        foo         => 'foo_value',
    };

    $tt->process('document', $vars);
}


main(@ARGV) unless caller();


__DATA__
___[ document ]___
This is the header.

It will include a subsection, based on the "subsection" variable:
[% INCLUDE $subsection %]

[% BLOCK block_a %]
This is block A.

Variable "foo" has value "[% foo %]".
[% END %]

[% BLOCK block_b %]
This is block B.

Variable "foo" has value "[% foo %]".
[%- END %]
