#!/usr/bin/perl

use strict ;

print "\n\n************************************* MAGIC SQUARE *****************************************\n" ;
print " Magic Square is an nxn matrix, where n is an Odd number.\n";
print " The sum of each row, the sum of each colum, vertically and horizontally, and the sum of each diagonal is the same.\n";
print " The mathematical formula to calculate the sum of an nxn matrix is : M=((n^2)((n^2)+1))/2\n" ;
print " Go on...try it out out!! Remember the row and column size should be the same and should also be an Odd number\n" ;
print "********************************************************************************************\n\n" ;

my @magicSquare = () ;
my ($rows, $columns) ;

print "Enter number of rows: \n" ;
chomp($rows=<STDIN>) ;
$rows-- ;

print "Enter number of columns: \n" ;
chomp($columns=<STDIN>) ;
$columns-- ;

my $currRow = 0 ;
my $currCol = $columns/2 ;

my $currValue = 1 ;

$magicSquare[$currRow][$currCol] = $currValue ;

while ( $currValue < (($rows+1)*($columns+1)) ) {
		$currValue++ ;
		my $nextRow = $currRow-1 ;
		my $nextCol = $currCol+1 ;

		if ( $nextRow < 0 && $nextCol > $columns ) {
			$nextRow+=2;
			$nextCol--;
		} elsif ( $nextRow < 0 ) { 
			$nextRow = $rows;  
			while ( exists($magicSquare[$nextRow][$nextCol]) ) {
				print "TEST : $nextRow\n" ;
				$nextRow-- ;
			}  
		} elsif ( $nextCol > $columns ) {
			$nextCol = 0 ;

			while ( defined($magicSquare[$nextRow][$nextCol]) ) {
				$nextCol++ ;
			}  
		} elsif ( defined($magicSquare[$nextRow][$nextCol]) ) {
			$nextRow = $currRow+1 ;
			$nextCol = $currCol ;
		} 

		$magicSquare[$nextRow][$nextCol] = $currValue ; 
		$currRow = $nextRow; $currCol = $nextCol;
}

print "\n*************************** Here is your Magic Square ************************************\n\n" ;
for ( my $i=0; $i<=$rows; $i++ ) {
	for ( my $j=0; $j<=$columns; $j++ ) {
		printf '%-4s', $magicSquare[$i][$j] ;
	}
	print "\n" ;
}
print "\n******************************************************************************************\n" ;
