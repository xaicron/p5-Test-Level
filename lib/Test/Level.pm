package Test::Level;

use strict;
use warnings;
use base 'Exporter';
use Test::Builder ();

our $VERSION = '0.01';

our @EXPORT = qw(test_level);

sub new {
    my ($class, %args) = @_;
    bless \%args, $class;
}

sub test_level {
    my $level = shift;
    my $org_level = $Test::Builder::Level;
    $Test::Builder::Level += $level;
    __PACKAGE__->new(org_level => $org_level);
}

sub DESTROY {
    my $self = shift;
    $Test::Builder::Level = $self->{org_level};
}

1;
__END__

=encoding utf-8

=for stopwords

=head1 NAME

Test::Level - shortcut of $Test::Builder::Level

=head1 SYNOPSIS

  use Test::More;
  use Test::Level;

  sub some_test {
      my $guard = test_level + 1;
      # some test ...
      some_test2();
      # some test ...
  }

  sub some_test2 {
      my $guard = test_level + 1;
      # some test ...
  }

  some_test();
  some_test2();
  # some test ...

  done_testing;

=head1 DESCRIPTION

Test::Level is shortcut of C<< local $Test::Builder::Level = $Test::Builder::Level + $level >>.

=head1 FUNCTIONS

=over

=item test_level($level)

  use Test::More;
  use Test::Level;

  sub some_test {
      # like local $Test::Builder::Level = $Test::Builder::Level + 1;
      my $guard = test_level + 1;
      # some test ...
  }

  some_test();

  done_testing;

=back

=head1 AUTHOR

xaicron E<lt>xaicron {at} cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2011 - xaicron

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
