#!/usr/bin/env perl

use strict;
use warnings;

use Env;
use File::Spec::Functions 'catfile';
use File::Copy;

if ($ENV{'PD_SKIP_TODO_FILE'} eq '1') {
    exit;
}

my $todo_folder = $ENV{TODO};

my @months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
my @days = qw(Sun Mon Tue Wed Thu Fri Sat Sun);

my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime();
# print "$mday $months[$mon] $days[$wday] $hour:$min:$sec\n";

my $filename = catfile($todo_folder, sprintf("%04d%02d%02d.org.gpg", $year + 1900, $mon + 1, $mday));
print "Todays todo file: $filename";

print "\n";
if (!(-e $filename)) {
    print "File does not exist.";

    # https://stackoverflow.com/questions/1045792/how-can-i-list-all-of-the-files-in-a-directory-with-perl
    opendir( my $data_dh, $todo_folder) or die "Cannot open $todo_folder\n";
    my @todo_file_list = reverse sort grep { /^.+\.org\.gpg$/ && -f "$todo_folder/$_" } readdir($data_dh);
    closedir($data_dh);

    if(!@todo_file_list) {
        die "No todo files found. Please create $filename.";
    }

    # print @todo_file_list;
    my $last_todo_file = shift @todo_file_list;
    $last_todo_file = catfile($todo_folder, $last_todo_file);

    print "\n\n";
    print "Last todo file was $last_todo_file.\n";

    # Copy last todo file to new todo file name
    print "Copy to $filename";
    copy($last_todo_file, $filename);

    # Done.

} else {
    print "File exists!!";
}


print "\n";

