#
!/bin/bash

# Tool Name: Prime_Tube
# Author: Primeplayer
# Date: 13/05/2021

R='\033[31m'
GRE='\033[32m'
W='\033[37m'
B='\033[34m'
GRA='\033[1;30m'
Y='\033[1;33m'
C='\033[1;36m'

clear

function banner () {
        echo -e ${Y}""
        cd files
        bash banner.sh
        cd ..
        echo " "
        echo " "
        echo -e ${GRE} "TIP- TYPE'help' FOR LIST OF COMMANDS "
        echo " "
        echo " "
}

function call_banner () {
        clear
        banner
}

function mv_videos () {
        mv *.mp4 /storage/emulated/0/Download
}

function mv_images () {
        mv *.jpg /storage/emulated/0/Download
}

call_banner

start="1" # Exit switch
while [ "$start" = "1" ]
do

    read -p "[Prime_Tube]~# " entry

    if [ "$entry" == "help" ]; then
            call_banner

	    cd files
            cd other_files
	    bash help.sh

	    cd ..
            cd ..

    elif [ "$entry" == "video" ]; then
            call_banner

            cd files
            cd core_files
            python video.py

            mv_videos

	    cd ..
            cd ..

            call_banner

    elif [ "$entry" == "photo" ]; then
            call_banner

            cd files
            cd core_files
            python photo.py

            mv_photo

	    cd ..
            cd ..

            call_banner

    elif [ "$entry" == "change" ]; then
            call_banner

            cd files
            cd other_files
            bash change.sh

            cd ..
            cd ..


    elif [ "$entry" == "about" ]; then
            call_banner

            cd files
            cd other_files
            bash about.sh

            cd ..
            cd ..

    elif [ "$entry" == "exit" ]; then
            echo
            echo -e ${W}"Thanks for using ${B}Prime_tube${W}, I hope you enjoyed your experience by using Prime_tube :)"

            sleep 3
            clear
            exit

    else
            echo
            echo -e ${R}"[!] ${W}Command not found, type ${R}help ${W}for commands"
           sleep 2

            call_banner
    fi

done
