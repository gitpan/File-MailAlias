# @(#)$Ident: Build.PL 2013-08-07 00:37 pjf ;

use strict;
use warnings;
use inc::Bob; # Module::Build subclass
use version; our $VERSION = qv( sprintf '0.18.%d', q$Rev: 1 $ =~ /\d+/gmx );

Bob->new( {
   module    => 'File::MailAlias',
   home_page => 'http://www.roxsoft.co.uk',
   requires  => {
      'perl'             => 5.010001,
      'namespace::sweep' => 0.006,
      'Class::Method::ModifiersX::Augment' => 0.001,
      'Date::Format'     => 2.22,
      'File::DataClass'  => q(0.22.0),
      'Moo'              => 1.002,
      'Text::Wrap'       => 2005.082401, },
   recommends            => {
      'App::cpanminus'   => 1.6005, },
   configure_requires    => {
      'version'          => 0.88,
      'Module::Build'    => 0.4004, },
   build_requires        => {
      'version'          => 0.88,
      'Module::Build'    => 0.4004,
      'Text::Diff'       => 1.37, },
} )->create_build_script; # Goal!

# Local Variables:
# mode: perl
# eval: (load-project-state "file-mailalias")
# tab-title: File::MailAlias
# tab-width: 3
# End:
