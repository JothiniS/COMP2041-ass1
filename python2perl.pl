
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
 
#regex to match  if statments 
if( $line=~ /^if/ &&  $line =~ /\:/ ) { 
	$line =~ s/if/if\(/g;
	$line=~s/$\:/\)/g;

		
	$line=~ s/\)/\)\{/g;
	
	
	$line=~ s/$/\;\}/g;

	
	$line=~m/continue/;
	$line=~s/continue/next/g;

	
	$line=~/break/;
	$line=~s/break//g;
#print "}\n";		
#regex to match else statements
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

	print "last\;\n\}\n";
#	print "\}\n";
#regex to match while statements
}elsif($line=~ /^while/ && $line=~ /\:/){
$line=~s/while/while\(/g ;
$line=~s/\:/\)/g;

$line=~s/\)/\)\{/g ;

$line=~ s/$/\;\}/g;

}elsif($line=~ /^while/ && $line=~ /\:/ && $line=~/print/){
$line=~s/\:/\)/g;

$line=~s/\)/\)\{/g ;
print"\n";
$line=~ s/$/\;\}/g;


#regex to match for loops
}elsif($line=~/^for/ && $line=~/\:/){
	$line=~s/in range/ /g;
	$line=~s/\(\,\ /\(\,\.\./g;
	$line=~s/$\:/\)\{/g; 
}
 	if($line =~ /([0-9])|(\")$/){
		print "$line;\n";
	

	
	}elsif($blank != 1){
		print "$line\n";

	}else{
		print "#$line\n";
	}
	
		
}
