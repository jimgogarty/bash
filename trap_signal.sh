#!/bin/sh
trap 'echo Hello World' USR1
trap 'rm testfile.txt' USR2
if  [ $? -eq 0 ]
then 
	echo "file deleted"
fi

while [ 1 -gt 0 ]
do
echo Running....
sleep 5
done
