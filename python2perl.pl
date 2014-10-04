
#!/usr/local/bin/perl
#By Jothini Sivananthan

while($line=<>){
$blank = 0;
chomp($line);
if ($line =~/^#!/ && $. == 1){
$line="#\!/usr/bin/perl -w"; 
} elsif ($line =~ /^\s*#/ || $line =~ /^\s*$/){
#Blank & comment lines can be passed unchanged
#print $line;
	$blank = 1;
} elsif ($line =~ /^\s*print\s*"?(.*)"?\s*$/) {
$line .= ";";
$line =~ s/;/\,"\\n\";/;
				
    }elsif($line =~m/hello world/){
                $line =~ s/;/,\"\\n\";/;
		print "$line";
    }elsif($line =~ /print/){
     $line.=",\"\\n\"";
#    }elsif($line =~s/factor/\$factor/g){
#	print $line =~ s/;/\,"\\n\";/;
#	print $line;

#$line=~s/^\ *[a-zA-Z_0-9]*\ *=/^\ *\$[a-zA-Z_0-9]*\ *=/g;
     # print "$line";
}elsif($line=~ /^\ *[a-zA-Z].*\ *=/){
$line=~ s/\s*//g;
$line .= ";";
@updatedArray = split(/\W/,$line);
push (@words,$updatedArray[0]);
}
$i=0;
while($i<=$#words){

	$line=~s/$words[$i]/\$$words[$i]/g;
 	$i++;
}
#$line=~s/var1/\$var1/g;
# $line =~ s/answer/\$answer/;
#$line=~ s/factor/\$factor/g; 

if( $line=~ /^if/ &&  $line =~ /\:/ ) { 
	$line =~ s/if/if\(/g;
	$line=~s/$\:/\)/g;
#	$line=~ s/break/break\;/g;
#	if($line=~/break\;/){
#		print "}\n";
#	}
		
	$line=~ s/\)/\)\{/g;
	#if($line=~/if$/ && $line=~/\d/){
#	$line=~ s/break/break\;/g;
#	print "}\n";
#	$line=~s/$\;/}/g;
	
	$line=~ s/$/\;\}/g;

	
#	$line=~m/continue/;
#	$line=~s/continue/next/g;
#	print "next\n";
	#$line=~s/import sys//g;
	
		
#$line=~/break/;
#$line=~s/break//g;
#}elsif($line=~/^if/ && $line=~/\:/){
#	$line=~s/if/if\(/g;
#	$line=~s/$\:/\)/g;
#	$line=~s/\)/\)\{/g;
#	$line=~s/continue/next/g;
#	print "}\n";


#print"last\;\n\}\n";

}elsif($line=~/else/ && $line=~/\:/){
$line=~s/else\:/\}else\{/g;
while($line=<>){
	if (eof){	
	print "}\n";
	}else{
	 exit 1;
}
}

}elsif($line=~/break/){
$line=~s/break//g;
#	$line=~s/last/last\;/g;
#	if($line=~last\;){
#	print "}\n";
#	}
	print "last\;\n\}\n";
#	print "\}\n";
}elsif($line=~ /^while/ && $line=~ /\:/){
$line=~s/while/while\(/g ;
$line=~s/\:/\)/g;

$line=~s/\)/\)\{/g ;

$line=~ s/$/\;\}/g;
#$line=~s/import sys//g;
#$line=~s/sys\./stdout\./write\("/> \"\)/print "> "/g;
}elsif($line=~ /^while/ && $line=~ /\:/ && $line=~/print/){
$line=~s/\:/\)/g;

$line=~s/\)/\)\{/g ;
print"\n";
$line=~ s/$/\;\}/g;


#}elsif($line=~/break/){
#$line=~s/break/break\;/g;


}elsif($line=~/^for/ && $line=~/\:/){
	$line=~s/in range/ /g;
	$line=~s/$\:/\)/g;
#	$line=~s/\(/\d\,/\d\(/\d\./\./\d/g; 
}
 	if($line =~ /([0-9])|(\")$/){
		print "$line;\n";
	
#	}elsif ($line=~s/if answer/if \(\$answer/){
#		print "$line\n";
	
	}elsif($blank != 1){
		print "$line\n";
#
	}else{
#		print "#$line\n";
	}
	
		
}
