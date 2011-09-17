use strict;
use warnings;
use Test::More;
use Test::Level;

sub some_test {
    my $org_level = $Test::Builder::Level;
    my $guard = test_level + 1;
    is $Test::Builder::Level, $org_level + 1, 'changed';
    is $guard->{org_level}, $org_level, 'original';
}

my $org_level = $Test::Builder::Level;

some_test();

is $Test::Builder::Level, $org_level, 'restored';

done_testing;
