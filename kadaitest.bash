#!/bin/bash

tmp=out
ERROR_EXIT(){
	echo "$1" >&2
	rm out
}

PARAM_CHECK()
{
if
	[ $1 -eq 0 ]
	then
	echo "NG=too much or less arguments"
	
fi
}

CHECK(){
	./kadai2 $(($1/$3)) $(($2/$3)) > $tmp
	gcd=`cat $tmp`
	if [ $gcd -eq 1 ]
	then
	echo "OK GCD is $3"
	fi
	
} 
#########################################
#test 10 20 30
#########################################
echo "10 20 30"
A=10
B=20
C=30
./kadai2 $A $B $C > $tmp
gcd=`cat $tmp`

PARAM_CHECK $gcd
#########################################
#test 10
#########################################
echo "10"
A=10
./kadai2 $A > $tmp
gcd=`cat $tmp`

PARAM_CHECK $gcd


#########################################
#test 10 20
#########################################
echo "10 20"
A=10
B=20

./kadai2 $A $B > $tmp
gcd=`cat $tmp`

PARAM_CHECK $gcd
CHECK $A $B $gcd
#########################################
#test 3304 242
#########################################
echo "3304 242"
A=3304
B=242

./kadai2 $A $B > $tmp
gcd=`cat $tmp`

PARAM_CHECK $gcd
CHECK $A $B $gcd
#########################################
#test 189010 32000
#########################################
echo "189010 32000"
A=189010
B=32000

./kadai2 $A $B > $tmp
gcd=`cat $tmp`

PARAM_CHECK $gcd
CHECK $A $B $gcd
###########################################
#Fail test
###########################################
echo "aiit 32000 going to fail"
A=aiit
B=32000

./kadai2 $A $B > $tmp || ERROR_EXIT "Expected Integer"
gcd=`cat $tmp`

PARAM_CHECK $gcd

rm out
echo "ALL TEST IS DONE "

