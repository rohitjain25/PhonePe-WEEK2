#!/usr/bin/perl -w
use List::MoreUtils qw(uniq);
print "<html>\n";
print "<head>\n";
print "<title>Parsed Nginx Data</title>\n";
print "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n";
print "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\n";
print "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\n";
print "</head>\n";
print "<body>\n";
print "<h2>----------------------</h2>\n";
print "<h2>Task for Week #2</h2>\n";
print "<h2>----------------------</h2>\n";
print "<h2>~Rohit Jain SRE intern</h2>\n";

@datearray=();
$LOGFILE = '/Users/rohitj.intern/Desktop/task2.log';
open(LOGFILE) or die("Could not open log file.");
foreach $line (<LOGFILE>) {
    
    ($ip, $date) = split(' ',$line);
    $time = substr($date, 12);
    $date = substr($date, 0, 11);
    push(@datearray, $date);

    # print "<button type=\"button\" data-toggle=\"collapse\" data-target=\"#demo\">$date</button>";
    # do line-by-line processing.
}
close(LOGFILE);



@uniqdate=uniq @datearray;
for(my $i = 0; $i <= $#uniqdate; $i++){
	# print("$uniqdate[$i] \n");
    print "<button type=\"button\" data-toggle=\"collapse\" data-target=\"#$i\">$uniqdate[$i]</button>\n\n";

    
    # $returnans = system 'bash', '-c', 'source test.sh; highest_requested $uniqdate[$i]';
    $data = `source day_wise.sh; highest_requested $uniqdate[$i]`;
    # my @ret = qx(/bin/bash -c "source test.sh; highest_requested $uniqdate[$i]");

    print "<p id=\"$i\" class=\"collapse\">$data</p>\n\n";
     

    # system('/bin/bash', '-c', 'source test.sh; highest_requested $uniqdate[$i] ') ; 
}
my $bash_script = '/Users/rohitj.intern/Desktop/perl/test.sh';
open(my $pipe, '-|', $bash_script) or die $!;
while (my $line = <$pipe>){
    print "<p>$line</p>\n";
        # print "<p id=\"$i\" class=\"collapse\"> $line </p>\n";
}

print "</body>\n";
print "</html>";