# -*- mode: Perl -*-

use ExtUtils::MakeMaker qw(WriteMakefile);

WriteMakefile(NAME         => "Data::Compare",
    META_MERGE => {
        license => 'other',
        resource => {
	    repository => 'https://github.com/DrHyde/perl-modules-Data-Compare'
        }
    },
              VERSION_FROM => "lib/Data/Compare.pm",
	      PREREQ_PM    => {
	          File::Find::Rule => 0.10,
		  Scalar::Util     => 0
              },
              dist         => { COMPRESS => "gzip", SUFFIX => "gz" },
	      clean        => { FILES => '*.bak *.old mibs/*.dump lib/*/*~' },
              );
