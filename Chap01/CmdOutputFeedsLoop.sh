#!/bin/bash
# Mastering Unix Shell Scripting 2nd ed 2008
# Using Command Output in a Loop , page 40,41

while read LINE
do
  echo "$LINE" >> /tmp/cofl.txt
done < <(ps -ef)  
# in the above line it is important NOT to have space like this  < (command) 
# and also to have space between the < < 
wc -l /tmp/cofl.txt
cat /tmp/cofl.txt
rm /tmp/cofl.txt
