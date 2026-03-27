#!/bin/bash

displayTasks() {
	echo "-------------------"
    echo "Scheduled  Tasks"
    OUTPUT=$(crontab -l 2>/dev/null)
    if [ -z "$OUTPUT" ]; then
        echo "No Tasks Scheduled."
    else
        echo "$OUTPUT"
	echo "-------------------"
    fi
}

addTask() {
	echo "-------------------"
	echo "Enter cron schedule (e.g., * * * *):"
	read SCHEDULE
	echo "Enter command to run:"
	read COMMAND
	(crontab -l 2>/dev/null; echo "$SCHEDULE $COMMAND") | crontab - 
	echo "Task added successfully" 
	echo "-------------------"
}

removeTask() {
	echo "-------------------"
	echo "Enter task to remove"
	read TASK
	crontab -l 2>/dev/null | grep -v "$TASK" | crontab -
	echo "-------------------"
	echo "Task removed successfully !"
}

readDocs() {
	echo " ------------Format to schedule tasks: -------------"
	echo "Note: u need to keep stars for fields u dont enter"
	echo " * refers to /"every/" , thus putting stars at any position rprepresents its respective time." 
	echo "5 * * * * -> 5 mins every hour, every day of month, every month, every day of week"
	echo ""
	echo "* * * * * <command_to_run>
| | | | |
| | | | day of week (0-7, 0 and 7 are Sunday)
| | | month (1-12)
| | day of month (1-31)
| hour (0-23)
minute (0-59)"
	
	echo "----------------------------"
	
	echo " ------------Examples -------------"
	echo "# Every minute
* * * * * /path/to/script.sh

# Every day at 3:30pm
30 15 * * * /path/to/script.sh

# Every Monday at 9am
0 9 * * 1 /path/to/script.sh

# Every 5 minutes
*/5 * * * * /path/to/script.sh"
	echo 
	echo "----------------------------"
	read -p " enter any key to continue " -n 1	

}

while true; do
	echo "--------Task Scheduler---------" 
	echo "1. Display Tasks"
	echo "2. Add Task"
	echo "3. Remove Task"
	echo "4. Read Docs"	
	echo "5. Exit"

	echo "Enter Your Choice: "
	read CHOICE
	
	case $CHOICE in
		1) displayTasks ;;
		2) addTask ;;
		3) removeTask ;;
		4) readDocs ;;
		5) exit 0 ;;
		*) echo "Invalid Option" ;;
	esac
done
	
	 
