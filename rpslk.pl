#!/usr/bin/env perl
# Example of using the module
# https://metacpan.org/pod/Game::RockPaperScissorsLizardSpock
use warnings;
use strict;
use Game::RockPaperScissorsLizardSpock;
my $PLAYER1_WINS=\1; # read-only reference
#my $PLAYER2_WINS=\2; # unneeded
my $PLAYERS_TIE=\3;
my ($human, $computer, $result, $wins, $losses, $ties)=(0,0,0,0,0,0);
my @choices = qw(r p s l k);
my %choices = 
    (   r => 'rock',
        p => 'paper',
        s => 'scissors',
        l => 'lizard', 
        k => 'Spock'
    );
 
print << 'UNTIL_HERE';
The Rules of Rock, Paper, Scissors, Lizard Spock
 
        Scissors cuts Paper
        Paper covers Rock
        Rock crushes Lizard
        Lizard poisons Spock
        Spock smashes Scissors
        Scissors decapitates Lizard
        Lizard eats Paper
        Paper disproves Spock
        Spock vaporizes Rock
        Rock crushes Scissors
 
UNTIL_HERE
 
while (1) {
    print "Enter one letter for your choice that shows in the ().\n";
    print "(r)ock, (p)aper, (s)cissors, (l)izard, or Spoc(k)\n";
    until (grep {$human} @choices) {
        chomp($human=<STDIN>);
        if ($human =~ /^q/i) {
            print "Thanks for playing!\n";
            exit;
        }
    }
    $human = $choices{$human}; # resolve letter key to weapon
    $computer = int(rand(scalar(@choices))); # integer index to @choices
    $computer = $choices[$computer]; # string key to %choices
    $computer = $choices{$computer};
    print "Your choice was to use $human\n";
    print "The computer choice was to use $computer\n";
    $result = rpsls($human, $computer);
    if ($result == $$PLAYERS_TIE) {
        $ties++;
        print "It was a tie!\n";
    } else {
        if ($result == $$PLAYER1_WINS) {
            $wins++;
            print "You won!\n";
        }
        else {
            $losses++;
            print "The computer won.\n";
        }
   }
   $human='';
   print "Wins: $wins, Losses: $losses, and Ties: $ties\n\n";
} 
