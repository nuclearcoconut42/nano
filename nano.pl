#!/usr/bin/perl
use warnings;
use strict;

package nano;
use base qw( Bot::BasicBot );

my $path;
my $prefix;

sub login{
    $path->say(
	channel => 'msg',
	msg => 'NickServ',
	body => 'identify '.$password;
	)
}

sub connected{
    $path = shift;
    $prefix = ".";
    login();
}

sub chanjoin{
    my ($self, $message) = @_;
    unless($message->{who} =~ m/nano-chan/){
	    return "Hello, $message->{who}!\n";
    }
}

sub help{
    "I say hello to people who enter the channel!"
}

nano->new(
    server => 'irc.rizon.io',
    channels => [ '#rice' ],
    nick => 'nano-chan',
    )->run();