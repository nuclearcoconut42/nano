#!/usr/bin/env perl

use diagnostics;
use warnings;
use strict;

package nano;
use parent qw( Bot::BasicBot::Pluggable );

my $path;
my $prefix;
my $login_pass;

my $nano = nano->new(
    server => 'irc.rizon.io',
    port => '6667',
    ssl => 0,
    channels => [ '#rice' ],
    username => 'nano-chan',
    nick => 'nano-chan',
);

sub login {
    $path->say(
    channel => 'msg',
    msg => 'NickServ',
    body => 'identify ' . $login_pass;
    )
}

sub connected {
    $path = shift;
    $prefix = ".";
    $login_pass = $ARGV[0];
    login();
}

sub chanjoin {
    my ($self, $message) = @_;
    unless($message->{who} =~ m/nano-chan/){
        return "Hello, $message->{who}!\n";
    }
}

sub help {
    "I say hello to people who enter the channel!"
}

$nano->run();
