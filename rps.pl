#!/usr/bin/env perl
# Rock, Paper, Scissors
# By Keith Wright
# 12/2/2013

use strict;
use diagnostics;

my (@choices, $wins, $losses, $ties);

sub init() {
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

sub bye{
    print << "END";
    
Bye! Thanks for playing Rock, Paper, Scissors!

You had $wins wins, $losses losses and $ties ties.

END
}

sub player() {
    my $key;
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
    my $pick = int(rand($#choices));
    return $choices[$pick];
}

sub fight() {
    my $user = shift @_;
    my $opponent = shift @_;
    if ($user =~ /^r/i) {
        if ($opponent =~ /^r/i) { 
            print "You both choose Rock, you tied!\n";
            $ties++;
        } elsif ($opponent =~ /^p/i) {
            print "Paper covers Rock, you lose!\n";
            $losses++;
        } elsif ($opponent =~ /^s/i) {
            print "Rock crushes Scissors, you win!\n";
            $wins++;
        }
    } elsif ($user =~ /^p/i) {
        if ($opponent =~ /^p/i) { 
            print "You both choose Paper, you tied!\n";
            $ties++;
        } elsif ($opponent =~ /^r/i) {
            print "Paper covers Rock, you win!\n";
            $losses++;
        } elsif ($opponent =~ /^s/i) {
            print "Rock crushes Scissors, you lose!\n";
            $wins++;
        }
    } elsif ($user =~ /^s/i) {
        if ($opponent =~ /^s/i) { 
            print "You both choose Scissors, you Tied!\n";
            $ties++;
        } elsif ($opponent =~ /^p/i) {
            print "Scissors cut Paper, you win!\n";
            $losses++;
        } elsif ($opponent =~ /^r/i) {
            print "Rock crushes Scissors, you lose!\n";
            $wins++;
        }
    }
    print "\n";
}

sub main() {
    &init();
    while (1) {
        my $user = &player();
        if ($user =~ /^q/i) {
            bye();
            last;
        }
        my $opponent = &computer();
        &fight($user, $opponent);
    }
}


main();