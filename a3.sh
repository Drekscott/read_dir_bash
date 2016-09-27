#! /bin/bash
#! /bin/sh

# Name:Dreyton Scott;	Class:ITC 510
# Assignment:3;		Due:9/21/16

# Function:usage(), Gives user insight on how to use script

usage(){
	echo "Usage: $0 <directory>"
	exit 1
}

# Function: Given a directory this function will print out all
# contents, and if it stumbles upon another directory then we
# recall this function. This will use a breadth first search
# approach.

process_directory(){
	echo "Directory Given: $1"
	lsdir=`ls -x $1`
	#check if input is directory
	if [ -d $1 ]; then
		echo "$lsdir"
		for dir in $lsdir; do
			dtopr=$1/$dir
			if [ -d $dtopr ]; then
				process_directory "$dtopr"
			fi
		done
	fi
	echo "Subprocess finished successfully"
}

if [[ $# -ne 1 || ! -d $1 ]]; then
	usage
fi
process_directory "$1"
echo "Process finished successfully"
exit

