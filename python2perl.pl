#!/usr/local/bin/perl -w
#By JothiniS
while($line=<>){
$blank = 0;
chomp($line);
if ($line =~/^#!/ && $. == 1) {
		$line =  "#!/usr/bin/perl -w";
} elsif ($line =~ /^\s*#/ || $line =~ /^\s*$/) {
#Blank & comment lines can be passed unchanged
#print $line;
$blank = 1;
} elsif ($line =~ /^\s*print\s*"?(.*)"?\s*$/) {
$line .= ";";
$line =~ s/;/\,"\\n\";/;
				
    }elsif($line =~m/hello world/){
                $line =~ s/;/,\"\\n\";/;
		print "$line";
    }elsif($line =~s/factor/\$factor/g){
	#print $line =~ s/;/\,"\\n\";/;
}
#	$line =~ s/factor/\$factor/;
#elsif($line =~s/answer/\$answer/g&& $line =~ s/if answer/if\(\answer/g &&$line=~ s/\:/\)/g ){
#}elsif( $line=~s/answer/\$answer/){
  $line =~ s/answer/\$answer/; 
if($line =~ s/ answer/\$answer/g &&  $line=~ s/\:/\)/g && $line =~ s/if /if\(/g && $line=~ s/\)/\)\{/g && $line =~/\;$/){
}elsif($line=~/\;$/){
#		print "}\n";
#
}elsif($line=~s/while /while\(/g && $line=~s/\)/\)\{/g && $line=~/\;$/){
	print"}\n";
}   

#	if($line =~ s/if answer/if\(\$answer/){
#	}	 	
#	print $line;
 
 	if($line =~ /([0-9])|(\")$/){
		print "$line;\n";
	
#	}elsif ($line=~s/if answer/if \(\$answer/){
#		print "$line\n";
	
	}elsif($blank != 1){
		print "$line\n";

	}else{
#		print "#$line\n";
	}
	
		
}
