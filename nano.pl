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
    server => 'irc.rizon.net',
    port => '6667',
    ssl => 0,
    channels => [ '#rice' ],
    username => 'nano-chan',
    nick => 'nano-chan',
);

sub connected {
    $path = shift;
    $prefix = ".";
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
