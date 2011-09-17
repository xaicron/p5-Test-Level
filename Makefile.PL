use inc::Module::Install;
name 'Test-Level';
all_from 'lib/Test/Level.pm';

#requires '';

test_requires 'Test::More', 0.96;

tests join q{ }, map { sprintf 't%s.t', '/*' x $_ } 1..3;
author_tests 'xt';

WriteAll;
