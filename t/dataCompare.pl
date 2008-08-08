#!/home/y/bin/perl -w

use strict;
use diagnostics;
use Data::Compare;
use JSON;

my $expFile = "test082_updateevent_multipleinvitees.exp";
my $outFile = "test082_updateevent_multipleinvitees.out";
# my $expFile = "/tmp/f1";
# my $outFile = "/tmp/f2";
#my @ignoreKeysList = ['ID', 'UID'];
my @ignoreKeysList = ['DTSTAMP_UTC','CREATED', 'LAST_MODIFIED', 'DATETIME', 'BUILD', 'SERVICE_VERSION', 'LAST_MOD_UTC', 'USER', 'ID', 'UID', 'INVID'];

my $string = '{"RESPONSE":{"CODE":0,"VALUE":{"DTEND":"20070803T183000","DTSTART_TZID":"America/Los_Angeles","SUMMARY":"Party Add event setup for updating the event later","RECUR":{"INTERVAL":1,"DEBUG_RRULESTR":"FREQ=DAILY;UNTIL=20081030;INTERVAL=1","FREQ":"DAILY","UNTIL":"20081030"},"ATTENDEE":[],"LOCATION":"","SEQUENCE":0,"UID":"24525ff3-40fc-40ba-b9a9-9a8245639701","DTEND_TZID":"America/Los_Angeles","ALL_DAY":false,"METHOD":"PUBLISH","STATUS":"CONFIRMED","DTSTART":"20070803T180000","REMINDER":[],"INVID":"613-612","DESCRIPTION":"go party","FOLDER_ID":10}},"REQUEST":{"USER":"autocaljson3","DTSTAMP_UTC":"20080407T210749Z","OPERATION":"ADD_EVENT","SERVICE_VERSION":"1.2","INTL":"us","BUILD":"5.0 hitaine 20080403-1715","SERVICE":"CAL"}}';

compareFiles($expFile, $outFile);

sub compareFiles {
    my ($file1, $file2) = @_;
    my $ref1 = getJsonRefFromFile($file1);
    my $ref2 = getJsonRefFromFile($file2);
    
    # from Data::Compare, comparing with the ignoreList
    my $c1 = Compare($ref1, $ref2, {ignore_hash_keys=> @ignoreKeysList});
    my $r1 = ($c1 == 1) ? "Match" : "Not a Match";
    print "result WITH ignore list:" . $r1 . "\n"; 
    
    # from Data::Compare, comparing without the ignoreList
    my $c2 = Compare($ref1, $ref2);
    my $r2 = ($c2 == 1) ? "Match" : "Not a Match";
    print "result WITHOUT ignore list:" . $r2 . "\n"; 
}

sub getJsonRefFromFile{
    my ($fileName) = @_;
    print "Processing file " . $fileName . "\n";
    open(DAT, "< $fileName") || die("Could not open request file!" . $fileName);
    my @fileContent = <DAT>;
    close DAT;
    my $str = "";
    foreach my $line (@fileContent){
        chomp $line;
        $str = $str. $line;
    }
    return convertToPerlHashRef($str);
    
}
sub convertToPerlHashRef {
    my ($string) = @_;
    print "String is " . $string . "\n";
    my $ref;
    $ref = from_json($string);
    return $ref;
}

               
            
