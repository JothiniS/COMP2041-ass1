#!/usr/local/bin/perl -w
while($line=<>){
if ($line =~/^#!/ && $. == 1) {
		print "#!/usr/bin/perl -w\n";
} elsif ($line =~ /^\s*#/ || $line =~ /^\s*$/) {
#Blank & comment lines can be passed unchanged
#print $line;
} elsif ($line =~ /^\s*print\s*"(.*)"\s*$/) {
print "print \"$1\\n\";\n";
     } elsif($line =~m/hello world/){
                print  "$line", "\n";
    }elsif($line =~ s/^/\$/g && $line =~ s/$/\;/){
	print "$line";
     }elsif($line =~ m/\+/){
	 print "$line\n";	
	}elsif($line=~m/\-/){
		print "$line";
	}elsif($line=~m/\*/){
		print "$line";
        }elsif($line=~m/\//){
        	print "$line";
 	}elsif($line=~m/\%/){
		print "$line";
	}elsif($line=m/\**/){
		print "$line";
        }elsif($line=~m/\>/){
        	print "$line";
        }elsif($line=~m/\</){
        	print "$line";;
        }elsif($line=~m/\!=/){
        	print "$line";
        }elsif($line=~m/\==/){
        	print"$line";
        }elsif($line=~m/\<>/){
        	print "$line";
        }elsif($line=~m/\>=/){
        	print "$line";
	}elsif($line=~m/\<=/){
		print "$line";
        }elsif($line=~m/\|/){
		print "$line";
        }elsif($line=~m/\^/){
		print "$line\n";        
        }else{
               print "match not found\n";
	}
}
