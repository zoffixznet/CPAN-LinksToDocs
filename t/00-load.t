#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 6;

BEGIN {
    use_ok('Carp');
	use_ok('CPAN::LinksToDocs');
}

diag( "Testing CPAN::LinksToDocs $CPAN::LinksToDocs::VERSION, Perl $], $^X" );

my $o = CPAN::LinksToDocs->new( tags => {foos => 'bars'} );
isa_ok($o, 'CPAN::LinksToDocs');
can_ok($o, qw(new link_for tags _make_tags _splitty _make_not_found_link));

my $VAR1 = [
          'http://perldoc.perl.org/functions/map.html',
          'http://perldoc.perl.org/functions/grep.html',
          'http://search.cpan.org/perldoc?Carp',
          'http://search.cpan.org/perldoc?perlrequick',
          'http://search.cpan.org/perldoc?perlretut',
          'http://search.cpan.org/perldoc?perlre',
          'http://search.cpan.org/perldoc?perlreref',
          'http://search.cpan.org/perldoc?perlboot',
          'http://search.cpan.org/perldoc?perltoot',
          'http://search.cpan.org/perldoc?perltooc',
          'http://search.cpan.org/perldoc?perlbot',
          'http://search.cpan.org/perldoc?SOMETHING_WEIRD'
        ];
is_deeply(
    $o->link_for('map,grep,Carp,RE,OOP,SOMETHING_WEIRD'),
    $VAR1,
    'checks for links'
);

is( $o->tags->{foos}, 'bars', 'custom tags' );