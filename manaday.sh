#! /bin/bash
echo "Starting cmd a day!" 
echo ""
echo "1: Checking the dependancies..."
manlib='/home/morne/dev/bash/src/man/deploy/manlib'
cd $manlib

manualsfound=$(ls -lR | grep ^d | wc -l)

if [ "$manualsfound" -eq "0" ]
  then
   	echo "No man folders found in manlib. These are required to continue - please investigate! Script will now exit."
    exit
fi

echo "1: done"
echo ""

echo "2: Cataloging the avaiable manuals..."

folderlist=$(ls -dv */ | cut -f1 -d'/')

counter=0
foldername=""
foldernames=()
for afolder in $folderlist; do
	#echo $afolder
	foldernames[$counter]=$afolder
	#echo ${foldernames[$counter]}
    let counter=counter+1
done
IFS=$'\n'


if [ "${#foldernames[@]}" -le "0" ]
  then
   	echo "No man folders found. Please investigate! Script will now exit."
    exit
else
		echo "  > man folders found=${#foldernames[@]}. Good to go!"		
fi


max=$( echo "${foldernames[*]}" | sort -nr | head -n1 ) #max includes folder zero (folder 0)
min=$(echo "${foldernames[*]}"  | sort -nr | tail -n1 ) #min should be zero as folder numbering is zero based

echo "2: done"


echo ""
echo "3: starting man selection..."
completed='/home/morne/dev/bash/src/man/deploy/completed'

mansentcounter=$(cat $completed| wc -l)
echo "Total commands sent (NOT including todays!)=" $mansentcounter

if [ "$mansentcounter" -ge "$max" ]
  then
   	echo "All manuals were sent. Resetting the completed file..."
   	> completed
fi

while true; do
	#generate random number between the smallest and largest number...
	genid=$(shuf -i $min-$max -n 1)
	echo "The man id for today is: $genid"

	if grep -Fxq $genid $completed
	then
	    echo "  > this was allready done - generate a new number..."
	else
	    echo "  > This was not yet done - send the mail!"
	   	#TODO - Send the mail
	    #insert the manid that was sent into the completed list 
	    echo $genid  >> $completed
	    echo "3: done"
	    break
	fi
done
