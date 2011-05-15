
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'A simple Web::Simple wrapper for GitHub\'s PostReceive hooks',
  'AUTHOR' => 'Matt Phillips <mattp@cpan.org>',
  'BUILD_REQUIRES' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'HTTP::Request::Common' => '0',
    'Plack::Test' => '0',
    'Test::More' => '0',
    'Test::Warn' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'WWW-GitHub-PostReceiveHook',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'WWW::GitHub::PostReceiveHook',
  'PREREQ_PM' => {
    'JSON' => '0',
    'Try::Tiny' => '0',
    'Web::Simple' => '0.008'
  },
  'VERSION' => '0.002',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



