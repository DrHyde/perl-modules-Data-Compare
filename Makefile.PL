use ExtUtils::MakeMaker qw(WriteMakefile);

WriteMakefile(
    NAME         => 'Data::Compare',
    META_ADD => {
	"meta-spec" => { version => 2 },
    },
    META_MERGE => {
	license => ["artistic_1", "gpl_2"],
	resources => {
	    repository => 'https://github.com/DrHyde/perl-modules-Data-Compare',
	    bugtracker => 'https://github.com/DrHyde/perl-modules-Data-Compare/issues'
	},
    },
    VERSION_FROM => "lib/Data/Compare.pm",
    PREREQ_PM    => {
	File::Find::Rule => 0.10,
	Scalar::Util     => 0
    },
    clean        => { FILES => '*.bak *.old mibs/*.dump lib/*/*~' },
);
