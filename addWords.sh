#!/bin/bash
########################################################
########################################################
##              Script Description                    ##
##                                                    ##
##      Script developed to create and add words      ##
##		in wordlist already created					  ##
##      Developer:      Júnior de Oliveira            ##
##      Date:           28/03/2018                    ##
##      Version:        1.0318.28                     ##
##                                                    ##
##                                                    ##
##                                                    ##
########################################################
########################################################

count=0
if [ "$#" -lt 1 ]
then
        echo "[!] Usage mode: $0 [file] [file to add more]"
        echo "Example $0 wordlist wordlistFinal "
else
	for sub in $(cat $1); do
		result=$(cat $2 | grep -w $sub)
		if [ "$result" = "" ];
		then
			echo "Subdomain added ==> " $sub
			echo $sub >> $2
			count=$(($count+1))
		fi
	done

	touch tempSub.txt
	cat $2 | sort | uniq > tempSub.txt
	cat tempSub.txt > $2
	rm -rf tempSub.txt

	echo "TOTAL WORDDS ADDED==> " $count
fi
