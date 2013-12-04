use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'CPAN::LinksToDocs',
    license             => 'perl',
    dist_author         => 'Zoffix Znet <zoffix@cpan.org>',
    dist_version_from   => 'lib/CPAN/LinksToDocs.pm',
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'Carp' => 1.04,
    },
    add_to_cleanup      => [ 'CPAN-LinksToDocs-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
