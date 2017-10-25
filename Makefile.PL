use ExtUtils::MakeMaker qw(WriteMakefile);

WriteMakefile(
  NAME         => 'Data::Compare',
  MIN_PERL_VERSION => 5.006,
  META_MERGE => {
    license => ["artistic_1", "gpl_2"],
    resources => {
      repository => 'https://github.com/DrHyde/perl-modules-Data-Compare',
      bugtracker => 'https://github.com/DrHyde/perl-modules-Data-Compare/issues'
    },
  },
  BUILD_REQUIRES => { "ExtUtils::MakeMaker" => 6.48 },
  VERSION_FROM => "lib/Data/Compare.pm",
  PREREQ_PM    => {
    File::Find::Rule   => 0.10,
    Scalar::Util       => 0,

    # we actually want T::D::NoTest, but the version is only specified in T::D
    Test::Deep::NoTest => 0,
    Test::Deep         => 1.127,
  },
  clean        => { FILES => '*.bak *.old mibs/*.dump lib/*/*~' },
);
