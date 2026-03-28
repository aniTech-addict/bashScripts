#!/bin/bash

# GAME SCOREBOARD
SCORE=0
TOTAL=0
CORRECT=0

MODE=0

# GAME DIMENSIONS
LINES=$(tput lines)-4
COLS=$(tput cols)

# TOP BORDER
printf '#%.0s' $(seq 1 $COLS)

echo -e "\e[36m"

echo "                                 TYPING GAME                          "
echo "                              TEST  YOUR  SPEED                       "

echo -e "\e[0m"
# BOTTOM BORDER
printf '#%.0s' $(seq 1 $COLS)

selectMode() {
    echo -e "\e[33m Select difficulty:\e[0m"
    echo "1. Easy"
    echo "2. Medium"
    echo "3. Hard"
    read -p "Enter Your Choice" MODE

    case $MODE in 
        1) TIME=7 ;;
        2) TIME=5 ;;
        3) TIME=3 ;;
        *) echo "Invalid option, setting to max difficulty" ; TIME=3 ;;
    esac
}

selectCategory() {
    echo -e "\e[33mSelect Category"
    echo "1. Numbers"
    echo "2. Letters"
    echo "3. Mixed"
    echo "4, Custom"
    read -p "Enter Choice" CHOICE

    case CHOICE in 
        1) CHARS="012345679" ;;
        2) CHARS="abcdefghijklmnopqrstwxy"
        3) CHARS="abcdefghijklmnopqrstwxy0123456789"
        4) read -p "Enter your words (space seperated)" CUSTOM_WORDS ;;
    esac
}


