#!/usr/bin/env perl
# Rock, Paper, Scissors
# By Keith Wright
# 12/2/2013
# 06/16/2016

use strict;
use diagnostics;
require 5.0;

my (@choices, $wins, $losses, $ties);
my ($win_text, $loss_text, $tie_text, $mins, $min_text, $secs, $sec_text);

&main();

sub init() {
    $SIG{INT}=\&bye;
    $SIG{TERM}=\&bye;
    srand(time);
    @choices = qw(r p s);
    $wins = 0; $losses = 0; $ties = 0; 
    print << 'END';
    
Welcome to Rock, Paper, Scissors!

You will play against the computer in this game.
To make a choice, use the first letter of the word:
r for rock, p for paper, s for scissors, or q to quit

END
}

sub status {
    $win_text = ($wins == 1) ? 'win' : 'wins';
    $loss_text = ($losses == 1) ? 'loss' : 'losses';
    $tie_text = ($ties == 1) ? 'tie' : 'ties'; 
    $secs = time - $^T;
    $mins = ($secs > 59) ? $secs % 60 : 0;
    $min_text = ($mins == 1) ? 'minute' : 'minutes';
    $secs = $secs - $mins * 60;
    $sec_text = ($secs == 1) ? 'second' : 'seconds';
    print << "END";
    
You have played for $mins $min_text and $secs $sec_text.

You have $wins $win_text, $losses $loss_text and $ties $tie_text.

END

};
sub bye{
    &status;
    print "Bye! Thanks for playing Rock, Paper, Scissors!\n\n";
    exit(0);
}

sub player() {
    my $key ='';
    until (grep {$key} @choices) {
        print "What do you choose (r, p, s, or q) ";
        chomp($key = <STDIN>);
        if ($key =~ /^q/i) {
            last;
        }
    }
    return $key; 
}

sub computer() {
    my $pick = int(rand(scalar @choices));
    return $choices[$pick];
}

sub play() {
    local $\="\n\n";
    my $user = shift @_;
    my $opponent = shift @_;
    print "\n\n";
    if ($user =~ /^r/i) {
        if ($opponent =~ /^r/i) { 
            print "You both choose Rock, you tied!";
            $ties++;
        } elsif ($opponent =~ /^p/i) {
            print "Paper covers Rock, you lose!";
            $losses++;
        } elsif ($opponent =~ /^s/i) {
            print "Rock crushes Scissors, you win!";
            $wins++;
        }
    } elsif ($user =~ /^p/i) {
        if ($opponent =~ /^p/i) { 
            print "You both choose Paper, you tied!";
            $ties++;
        } elsif ($opponent =~ /^r/i) {
            print "Paper covers Rock, you win!";
            $wins++;
        } elsif ($opponent =~ /^s/i) {
            print "Scissors cut Paper, you lose!";
            $losses++;
        }
    } elsif ($user =~ /^s/i) {
        if ($opponent =~ /^s/i) { 
            print "You both choose Scissors, you Tied!";
            $ties++;
        } elsif ($opponent =~ /^p/i) {
            print "Scissors cut Paper, you win!";
            $wins++;
        } elsif ($opponent =~ /^r/i) {
            print "Rock crushes Scissors, you lose!";
            $losses++;
        }
    }
    &status;
}

sub main() {
    &init();
    while (1) {
        my $user = &player();
        if ($user =~ /^q/i) {
            bye();  
        }
        my $opponent = &computer();
        &play($user, $opponent);
    }
}

