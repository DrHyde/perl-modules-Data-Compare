#!perl -w
# $Id: saritha-nalagandla.t,v 1.1 2008/08/08 00:24:42 drhyde Exp $

use strict;
use Test::More tests => 1;

use Data::Compare;

my $data; $data = {
          'RESPONSE' => {
                          'VALUE' => {
                                       'SUMMARY' => 'Party Update event 082',
                                       'UID' => '7f50bbc4-daa6-4212-9111-a7db981fbabf',
                                       'ACCOUNT_ID' => 'autocaljson3',
                                       'STATUS' => 'CONFIRMED',
                                       'TRANSP' => 'OPAQUE',
                                       'COMMENT' => [
                                                      'test comment'
                                                    ],
                                       'DTEND_TZID' => 'America/Los_Angeles',
                                       'INVID' => '323-322',
                                       'ORGANIZER' => 'autocaljson3@yahoo.com',
                                       'LAST_MODIFIED' => '20080806T233454',
                                       'COMPONENT_TYPE' => 'EVENT',
                                       'DTSTART' => '20080820T090000',
                                       'ALL_DAY' => bless( do{\(my $o = 0)}, 'JSON::PP::Boolean' ),
                                       'ATTENDEE' => [
                                                       {
                                                         'PARTSTAT' => 'ACCEPTED',
                                                         'EMAIL' => 'f323_bart1@yahoo.com',
                                                       },
                                                       {
                                                         'PARTSTAT' => 'DECLINED',
                                                         'EMAIL' => 'f323_bart2@yahoo.com',
                                                       }
                                                     ],
                                       'CLASS' => 'PUBLIC',
                                       'LOCATION' => 'test loc',
                                       'DURATION' => 'PT30M',
                                       'DTSTART_TZID' => 'America/Los_Angeles',
                                       'TYPE' => 10,
                                       'DTEND' => '20080820T093000',
                                       'DESCRIPTION' => 'go party',
                                       'FOLDER_ID' => 131
                                     },
                          'CODE' => 0
                        },
          'REQUEST' => {
                         'DTSTAMP_UTC' => '20080806T233454',
                         'BUILD' => '5.0 akanjila 20080806-1047',
                         'INTL' => 'us',
                         'SERVICE_VERSION' => '1.2',
                         'OPERATION' => 'UPDATE_EVENT',
                         'SERVICE' => 'CAL',
                         'USER' => 'autocaljson3'
                       }
        };
$data->{RESPONSE}->{VALUE}->{ATTENDEE}->[0]->{RSVP} = 
  $data->{RESPONSE}->{VALUE}->{ATTENDEE}->[1]->{RSVP} = 
    $data->{'RESPONSE'}{'VALUE'}{'ALL_DAY'};

ok(Compare($data, $data), "Saritha Nalagandla's failing test now works");
