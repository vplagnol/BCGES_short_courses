#!//usr/bin/perl

while (<>) {

    my @spl = split ('\t', $_);
    my @CIGARNUM = split('[A-Z]', $spl[5]);
    my $CIGARTEXT = $spl[5];
    $CIGARTEXT =~ s/[0-9]*//g;

    if ($spl[6] eq "=") {
	    
	    if ($CIGARTEXT eq "MNM") {
		    
		    my $startIntron = $spl[3] + $CIGARNUM[0] - 1;
		    my $endIntron = $spl[3] + $CIGARNUM[0] + $CIGARNUM[1] - 1;
		    my $chromosome = $spl[2];

		    print $spl[0]."\t".$CIGARTEXT."\t".$chromosome."\t".$startIntron."\t".$endIntron."\n";
		}
	}
}