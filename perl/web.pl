#!/usr/bin/perl -w
use strict;
use CGI qw(:standard);

#some variables
my $message = "please wait, loading data...\n";

#First build the web page
print header;
print start_html('Hello World');
print "<H1>we need love, peace and harmony</H1>\n";
print "<p>$message</p>\n";

#Establish a pipeline between the bash and my script.
my $bash_command = '/Users/mehul.intern/development/bash/scripts/test.sh';
open(my $pipe, '-|', $bash_command) or die $!;

while (my $line = <$pipe>){
# Do something with each line.
print "<p>$line</p>\n";
}

#job done, now refresh page?

print end_html;
