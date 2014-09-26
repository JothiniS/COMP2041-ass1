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
	$line=~s/\:/\)/g;
	#$line=~s/[0-9]\:/\{/g;
	$line=~ s/\)/\)\{/g;
	#if($line=~/if$/ && $line=~/\d/){
	
	$line=~ s/$/\;\}/g;
	#}
	#$line=~s/\d$/\d\{/g;
	#$line=~s/\:/\)/g;
#}elsif( $line=~ s/\:/\)/g && $line =~ s/if /if\(/g && $line=~ s/\)/\)\{/g && $line =~/\;$/){
#}elsif($line=~ /^if/ && $line=~/\;$/){
#$line=~ s/\;$/\;\}/g;
	#print "}\n";
#}elsif($line=~s/if /if\(/g){

}elsif($line=~ /^while/ && $line=~ /\:/ && $line=~/print/){
$line=~s/while/while\(/g ;
$line=~s/\:/\)/g;
$line=~s/\)/\)\{/g ;
$line=~ s/$/\;\}/g;
#$line=~/\;$/){
	#print"}\n";
#}elsif($line=~s/factor/\$factor/g){
#	print "$line";   
#}elsif($line=~s/var1/\$var1/g){
#	print "$line";
#}elsif($line=~s/var2/\$var2/g){
	#print "$line";
#	if($line =~ s/if answer/if\(\$answer/){
#	}	 	
#	print $line;
#}elsif($line=~ 
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
