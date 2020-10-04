#!/bin/bash
#Abhishek
input=Input2.csv
OLDIFS=$IFS
IFS=','
[ ! -f $input ] && { echo "$INPUT file not found"; exit 99; }
sed 1d $input | while read -r Name email repolink
do
	echo "Name : $Name"
	echo "Email ID : $email"
	echo "Repo Link : $repolink"
      	git clone $repolink
      	folder=$(basename  "$repolink"|cut -d . -f1)
	echo $folder
	chmod 777 $folder
	mv /home/abhi/Results.csv /home/abhi/$folder/
	cd $folder
	make
	touch val.txt
	touch cpp.txt
	chmod 777 val.txt
	chmod 777 cpp.txt
	valgrind ./all.out 2> val.txt
	cppcheck ./all.out 2> cpp.txt
	cp1=$(grep -wc "error" cpp.txt)
	va1=$( tail -n 1 val.txt )
	echo $cp1
	echo $va1
	if [ $? -eq 0 ]; then
		printf '%s' $Name,$email,$repolink,success,success,$cp1,$va1 | paste -sd ',' >> Results.csv
	fi
	echo
done < $input
IFS=$OLDIFS
