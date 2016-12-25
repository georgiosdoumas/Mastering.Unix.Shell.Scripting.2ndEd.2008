#!/bin/bash
# Using getopts to Parse Command-Line Arguments , pages 33,34 correcting all the mistakes from the book. 
SECS=0		# Initialize all to zero
MINUTES=0
HOURS=0
TOTAL_SECONDS=0   ## missing from the book! 
PROCESS=	# Initialize to null
usage () { 
	echo "$(basename $0) -s S -m M -h H ";echo "Where S is integer number for seconds,M for minutes,H for hours";
}
while getopts :s:m:h:d:p: TIMEOPT 2>/dev/null
do
	case $TIMEOPT in
		s) SECS=$OPTARG ;;
		m) (( MINUTES = $OPTARG * 60 )) ;;
		h) (( HOURS = $OPTARG * 3600 ))	;;
		d) (( DAYS = $OPTARG * 86400 )) ;;
		p) PROCESS=$OPTARG ;;
		\?) usage ; exit 1 ;;
	esac
done
(( TOTAL_SECONDS = $SECS + $MINUTES + $HOURS + $DAYS ))
echo "We will monitor the application $PROCESS for $TOTAL_SECONDS seconds"
