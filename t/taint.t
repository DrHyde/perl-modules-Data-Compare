#!perl -w

if($^O !~ /vms/i) {
    # we don't just use -T in shebang above cos that's not 5.6-friendly
    # and $^X isn't VMS-friendly.  I'm disinclined to add a dependency on
    # Probe::Perl just for testing this corner-case
    exec("$^X -Tw -Iblib/lib t/realtainttest");
} else {
    print "1..0 # skip - can't reliably taint-test on VMS\n";
}
