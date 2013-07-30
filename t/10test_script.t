# @(#)$Id: 60mailalias.t 431 2013-04-01 01:11:58Z pjf $

use strict;
use warnings;
use version; our $VERSION = qv( sprintf '0.17.%d', q$Rev: 1 $ =~ /\d+/gmx );
use File::Spec::Functions;
use FindBin qw( $Bin );
use lib catdir( $Bin, updir, q(lib) );

use English qw(-no_match_vars);
use Module::Build;
use Test::More;

BEGIN {
   my $current = eval { Module::Build->current };

   $current and $current->notes->{stop_tests}
            and plan skip_all => $current->notes->{stop_tests};
}

use File::DataClass::IO;
use Text::Diff;

use_ok 'File::MailAlias';

my $args   = { path => [ qw(t aliases) ], tempdir => q(t) };
my $schema = File::MailAlias->new( $args );

isa_ok $schema, 'File::MailAlias';

my $dumped = catfile( qw(t dumped.aliases) ); io( $dumped )->unlink;

$schema->dump( { data => $schema->load, path => $dumped } );

my $diff = diff catfile( qw(t aliases) ), $dumped;

ok !$diff, 'Load and dump roundtrips'; io( $dumped )->unlink;

$schema->dump( { data => $schema->load, path => $dumped } );

$diff = diff catfile( qw(t aliases) ), $dumped;

ok !$diff, 'Load and dump roundtrips 2';

done_testing;

# Cleanup

io( $dumped )->unlink;
io( catfile( qw(t ipc_srlock.lck) ) )->unlink;
io( catfile( qw(t ipc_srlock.shm) ) )->unlink;
io( catfile( qw(t file-dataclass-schema.dat) ) )->unlink;

# Local Variables:
# mode: perl
# tab-width: 3
# End: