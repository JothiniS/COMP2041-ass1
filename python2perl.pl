#!/usr/local/bin/perl -w

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
#	print $line =~ s/;/\,"\\n\";/;
	
  }   
	$line =~ s/answer/\$answer/;
#	print $answer;
  
#	$line =~ s/\if$answer/if(\$answer/; 	
#   }elsif($line =~ s/if answer/if(\$answer/g){
#	print $line;
 	if($line =~ /([0-9])|(\")$/){
		print "$line;\n";
	
	}elsif ($line=~s/if /if(/){
		print "$line;\n";
	
	}elsif($blank != 1){
		print "$line\n";

	}else{
#		print "#$line\n";
	}
	
		
}
