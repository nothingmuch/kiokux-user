#!/usr/bin/perl

package KiokuX::User;
use Moose::Role;

use namespace::clean -except => 'meta';

our $VERSION = "0.01";

with qw(
	KiokuX::User::ID
	KiokuX::User::Password
);

__PACKAGE__

__END__

=pod

=head1 NAME

KiokuX::User - A generic role for user objects stored in L<KiokuDB>

=head1 SYNOPSIS

	package MyFoo::User;
	use Moose;

	use KiokuX::User::Util qw(crypt_password);

	with qw(KiokuX::User);

	my $user = MyFoo::User->new(
		id		 => $user_id,
		password => crypt_password($password),
	);

	$user->kiokudb_object_id; # "user:$user_id"

	if ( $user->check_password($read_password) ) {
		warn "Login successful";
	} else {
		warn "Login failed";
	}

=head1 DESCRIPTION

This role provides a fairly trivial set of attributes and methods designed to
ease the storage of objects representing users in a KiokuDB database.

It consumes L<KiokuX::User::ID> which provides the C<id> attribute and
L<KiokuDB::Role::ID> integration, and L<KiokuX::User::Password> which provides
an L<Authen::Passphrase> based C<password> attribute and a C<check_password>
method.

=head1 VERSION CONTROL

L<http://github.com/nothingmuch/kiokux-user/>

=head1 AUTHOR

Yuval Kogman E<lt>nothingmuch@woobling.orgE<gt>

=head1 COPYRIGHT

	Copyright (c) 2008 Yuval Kogman. All rights reserved
	This program is free software; you can redistribute
	it and/or modify it under the same terms as Perl itself.

=cut
