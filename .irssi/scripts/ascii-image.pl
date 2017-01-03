use Irssi;
use strict;
use LWP;
use LWP::UserAgent;
use URI::Escape;
use vars qw($VERSION %IRSSI);

$VERSION = '2.0';
%IRSSI = (
    authors     => 'Aurélien Thieriot',
    contact     => 'a.thieriot@gmail.com',
    name        => 'irssi ascii image',
    description => 'Display an ASCII representation of an image using jp2a.',
    license     => 'MIT',
    url         => 'https://github.com/athieriot/irssi-ascii-image',
    changed     => '2016-12-22',
);

my $ua = LWP::UserAgent->new;
$ua->agent("Display an ASCII representation of an image using jp2a");
$ua->timeout(15);

# All of these functions are pretty much the same. There must be a way to
# consolidate them.
sub message_public {
	my ($server, $msg, $nick, $address, $target) = @_;
	my $new_msg = message($msg);
	Irssi::signal_continue($server, $new_msg, $nick, $address,
		$target);
}
sub message_private {
    my ($server, $msg, $nick, $address) = @_;
    my $new_msg = message($msg);
    Irssi::signal_continue($server, $new_msg, $nick, $address);
}

# This is where the magic happens.
sub message {
	my ($msg) = @_;
	# Split $msg into an array delimited by spaces.
	# Check each element for ^http:// or ^https://
	# If it matches, replace it with the response from longurl's API
	# 	Unless there's an error
	# Collapse the array back into a single value and return it

	my @values = split(' ', $msg);
	foreach my $val (@values) {
		if ($val =~ /(jpg|gif|jpeg|png)$/i) {
            $val = `jp2a --colors --grayscale -f -`;
		}
	}
	return join(' ', @values);
}

Irssi::signal_add_last("message public", "message_public");
Irssi::signal_add_last("message private", "message_private");
