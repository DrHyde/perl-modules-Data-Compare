use ExtUtils::MakeMaker qw(WriteMakefile);

WriteMakefile(
  NAME         => 'Data::Compare',
  META_MERGE => {
    license => ["gpl_2"],
    resources => {
      repository => 'https://github.com/DrHyde/perl-modules-Data-Compare',
      bugtracker => 'https://github.com/DrHyde/perl-modules-Data-Compare/issues'
    },
    "meta-spec" => { version => 2 },
  },
  VERSION_FROM => "lib/Data/Compare.pm",
  PREREQ_PM    => {
    File::Find::Rule => 0.10,
    Scalar::Util     => 0
  },
  clean        => { FILES => '*.bak *.old mibs/*.dump lib/*/*~' },
  LICENSE => "artistic_1",
);
