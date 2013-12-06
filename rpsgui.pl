#!/usr/bin/env perl
# Rock, Paper, Scissors
# By Keith Owens Wright
# 12/5/2013

require 5.0; # specify minimum version
use strict; # pragma
use diagnostics; # pragma
use Tk; # module

&gui; # start the main routine

my (@choices, $wins, $losses, $ties, $mw, $info,);

sub play {
    my $result = '';
    my $user = shift @_;
    my $opponent = shift @_;
    if ($user =~ /^r/i) {
        if ($opponent =~ /^r/i) { 
            $result = "You both choose Rock, you tied!";
            $ties++;
        } elsif ($opponent =~ /^p/i) {
            $result = "Paper covers Rock, you lose!";
            $losses++;
        } elsif ($opponent =~ /^s/i) {
            $result = "Rock crushes Scissors, you win!";
            $wins++;
        }
    } elsif ($user =~ /^p/i) {
        if ($opponent =~ /^p/i) { 
            $result = "You both choose Paper, you tied!";
            $ties++;
        } elsif ($opponent =~ /^r/i) {
            $result = "Paper covers Rock, you win!";
            $wins++;
        } elsif ($opponent =~ /^s/i) {
            $result = "Scissors cut Paper, you lose!";
            $losses++;
        }
    } elsif ($user =~ /^s/i) {
        if ($opponent =~ /^s/i) { 
            $result = "You both choose Scissors, you Tied!";
            $ties++;
        } elsif ($opponent =~ /^p/i) {
            $result = "Scissors cut Paper, you win!";
            $wins++;
        } elsif ($opponent =~ /^r/i) {
            $result = "Rock crushes Scissors, you lose!";
            $losses++;
        }
    }
    &inforesult($result);
}

sub inforesult {
    my $result = shift @_;
    # print $result;
    $info -> configure(-text => $result);
    $mw -> update;
    sleep 2;
    $info -> configure(-text => &status);
    $mw -> update;
}

sub status {
    my ($win_text, $loss_text, $tie_text);
    $win_text = ($wins == 1) ? 'win' : 'wins';
    $loss_text = ($losses == 1) ? 'loss' : 'losses';
    $tie_text = ($ties == 1) ? 'tie' : 'ties'; 
    my $stat = "$wins $win_text, $losses $loss_text and $ties $tie_text";
    return $stat;
}

sub versus {
    return $choices[int(rand(scalar(@choices)))];
}

sub gui {
    @choices = qw(r p s);
    $wins = 0; $losses = 0; $ties = 0; 
    $mw = MainWindow -> new;
    $mw -> title("Rock, Paper, Scissors");
    $mw -> geometry('300x150');
    my $rock_image = $mw -> Pixmap(-data => &rock_pix);
    my $paper_image = $mw -> Pixmap(-data => &paper_pix);
    my $scissors_image = $mw -> Pixmap(-data => &scissors_pix);
    my $title = $mw -> Label(-text => "Rock, Paper, Scissors",
       -font => '-adobe-helvetica-medium-o-normal--24-240-75-75-p-130-iso8859-1',
       -width => 50) -> pack;
    my $instructions = $mw -> Label(-text => "Click on an object to play.", 
       -width => 50) -> pack;
    my $top_frame = $mw -> Frame -> pack(-anchor => 'n');
    my $bot_frame = $mw -> Frame -> pack(-anchor => 's');
    my $rock = $top_frame -> Button(-image => $rock_image, 
       -command => sub {&play('r', &versus)}) 
       -> pack(
       -anchor => 'n', 
       -padx => 10,
       -pady => 10,
       -expand => 1,
       -side => 'left',
       );
    my $paper = $top_frame -> Button(-image => $paper_image, 
       -command => sub {&play('p', &versus)}) 
       -> pack(
       -anchor => 'n', 
       -padx => 10,
       -pady => 10,
       -expand => 1,
       -side => 'left',
       );             
    my $scissors = $top_frame -> Button(-image => $scissors_image,                      
       -command => sub {&play('s', &versus)}) 
       -> pack(
       -anchor => 'n', 
       -padx => 10,
       -pady => 10,
       -expand => 1,
       -side => 'left',
       ); 
    $info = $bot_frame -> Label -> pack(-anchor => 's',
                         -side =>'bottom'); 
    $mw -> protocol('WM_DELETE_WINDOW' => sub { Tk::exit });
    MainLoop;
}

sub rock_pix {
my $rock_data = << "END_ROCK";
/* XPM */
static char * rock_xpm[] = {
"50 50 5 1",
" 	c None",
".	c #0A0C08",
"+	c #4D4E4C",
"@	c #90928F",
"#	c #F8FAF7",
"                                                  ",
"                       ......                     ",
"                     .+@#@@@++....                ",
"                     .##########@+.               ",
"                    ..@###########+.              ",
"                   .+##############+.             ",
"                 ...+###############.             ",
"                .+.@################+.            ",
"              ..@#+@################@.            ",
"             .+####.@###############@.            ",
"            .@######+@###############.            ",
"           +#########################+.           ",
"         .@##########################@.           ",
"        .@######################@@@###..          ",
"       .+#######################@@++##@.          ",
"      ..########+@#################+###+.         ",
"     ..+########@########+#######++.###@.         ",
"     ...#########################@+.###@..        ",
"    .+..###@@#######@############@@.##@+@..       ",
"    .@.@###.@#######@############@+@##.++..       ",
"    .#+@###@#########################+.##...      ",
"    .#@.###.#########################.......      ",
"    .@#.###.#####################+##@..@@@+.      ",
"    .+#+@##.############@#@#########+@..+++.      ",
"    ++#@+#@.############+@@########@@#++#@..      ",
"   .+@@###.@#######################.++.....       ",
"   .+#+##@.#######################++...+...       ",
"    +#.###.#######.@#######+######.+..+@+..       ",
"    .#++##@@######@########@#####+.....+@..       ",
"    .@###########################++@.......       ",
"   ..+#########################@++.+#......       ",
"   ..@##@######################..@+.++#+.@+       ",
"   .@##@@######################+..+#.+@....       ",
"   .+##@@######################@.@++++.....       ",
"    .@##@##################@@+.#++#@.+....        ",
"    ..#########@##########+....+#@++++...         ",
"    ..@######@..+@######@+....#@.@+......         ",
"     ...@@@#@........++.....+..@...+....          ",
"      ........@@.@@.......+@..@..+......          ",
"       .......@@.+....@+..+@@+.+........          ",
"        ....+@..@...........++@+.@#..             ",
"         ...@#.....+..........##.+@.              ",
"           ..........@+.+.+...@#...               ",
"            .........@#.@.##@..+                  ",
"       .          ....+...@@+..                   ",
"          .           ......                      ",
"                                                  ",
"                                                  ",
"         .                                        ",
"                                                  "};
END_ROCK
return $rock_data;
};

sub paper_pix {
my $paper_data = << "END_PAPER";
/* XPM */
static char * paper_xpm[] = {
"50 50 5 1",
"       c None",
".      c #151512",
"+      c #4C4B49",
"@      c #918F8D",
"#      c #FAFCF9",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                         .                        ",
"                       .+@@++.....       .......  ",
"                      +@##########@@@@@@@@####+.  ",
"                    .+#######################++.  ",
"                   .@#######################+@+.  ",
"                  +########################+@+..  ",
"                .@########################+++..   ",
"               .@########################++@.     ",
"              +########################@++@+      ",
"             @########################@+@++       ",
"           .@########################@@@+.        ",
"          +#########################@@@+..        ",
"         +#########################@+@+..         ",
"       .@#########################@+@+..          ",
"      .@##########################+++..           ",
"     .###########################++@..            ",
"    .###########################.++..             ",
"   .##########################@+.++.              ",
"  +##########################@..+@.               ",
" .@#########################@..+@.                ",
"  ..++@####################@.++@.                 ",
"  +@@++.+++@@@@@@@@@@@@@@@@++.+.                  ",
"  ..+++@@+....++@@+@@@@@@@+....                   ",
"  ........+@@@+......+........                    ",
"           ..+@@@@@@@+++++...                     ",
"                    ++++++.                       ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  "
};
END_PAPER
return $paper_data;
}

sub scissors_pix {
my $scissors_data = << "END_SCISSORS";
/* XPM */
static char * scissors_xpm[] = {
"50 50 5 1",
" 	c None",
".	c #231F1E",
"+	c #565150",
"@	c #979392",
"#	c #EFEFED",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"        .++.                                      ",
"       +####@+                                    ",
"      +#######@                                   ",
"     .##########+                                 ",
"     @+@#########+                                ",
"    +@@@@#########@+                              ",
"    @#@@+@@#########@                @@##@+       ",
"    @####@+@#########@             +#######@      ",
"    @######++@########@.          @##@....@#@     ",
"    @########++#########.        +##.      @#+    ",
"    +@########@@@########+       ##.        @@    ",
"      +@########@+#######@      @#+         +@.   ",
"        +#########+#######@     @#.         +#.   ",
"          @########+@######+    @#.         +#.   ",
"           .@#######@@####@#    @#.         +#.   ",
"             +.@#####@+##@@@+@####.         +#.   ",
"               .+@#####+@@+@@##@@#@         @@    ",
"                 +@+@@##+@##@++. @#+       +#+    ",
"                  .+++@@+.##@     @#@     +#@     ",
"                     .++  +##+     @##@@@@#@      ",
"                           @#@      +@@@@@+       ",
"                           .@#+.+@@+.  ..         ",
"                            +@#######@+           ",
"                             @##@@@@@#@+          ",
"                             @#@    .+##.         ",
"                            +#@       +#+         ",
"                            @#.        @@.        ",
"                            @@         +#.        ",
"                            @@         .@.        ",
"                            @+         .@.        ",
"                            @+         .@.        ",
"                            +@         +@.        ",
"                             @+       .@+         ",
"                             +#+      @@.         ",
"                              @#@+..+@@+          ",
"                               @##@@@+.           ",
"                                 +++.             ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  "
};
END_SCISSORS
return $scissors_data;  
}