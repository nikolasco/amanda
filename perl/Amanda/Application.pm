# vim:ft=perl
# Copyright (c) 2005-2008 Zmanda, Inc.  All Rights Reserved.
#
# This library is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License version 2.1 as
# published by the Free Software Foundation.
#
# This library is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
# License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this library; if not, write to the Free Software Foundation,
# Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA.
#
# Contact information: Zmanda Inc., 465 S Mathlida Ave, Suite 300
# Sunnyvale, CA 94086, USA, or: http://www.zmanda.com

package Amanda::Application;
use base qw(Amanda::Script_App);

use strict;
use warnings;

=head1 NAME

Amanda::Application - perl utility functions for Applications.

=head1 SYNOPSIS

  package Amanda::Application::my_application;
  use base qw(Amanda::Application);

  sub new {
    my $class = shift;
    my ($foo, $bar) = @_;
    my $self = $class->SUPER::new();

    $self->{'foo'} = $foo;
    $self->{'bar'} = $bar;

    return $self;
  }

  # Define all command_* subs that you need, e.g.,
  sub command_support {
    my $self = shift;
    # ...
  }

  package main;

  # .. parse arguments ..

  my $application = Amanda::Application::my_application->new($opt_foo, $opt_bar);
  $application->do($cmd);

=cut

sub new {
    my $class = shift;

    my $self = Amanda::Script_App::new($class, "client", "application", @_);

    $self->{known_commands} = {
        support   => 1,
        selfcheck => 1,
        estimate  => 1,
        backup    => 1,
        restore   => 1,
        validate  => 1,
    };
    return $self;
}

1;