#! /bin/bash

# create name list and checks if name already exists inside the folder
function create_name_list() {
    read -p "Enter in what folder you want to write: " FOLDERNAME
    if [[ $FOLDERNAME ]]
    then
        # creates folder with the given name
        mkdir "$FOLDERNAME"
        # reads input and writes it to the file
        read -p "Enter your name: " NAME
        # checks if entered name already exists inside the name.txt file
        if grep -Fxq "$NAME" $FOLDERNAME/names.txt
        then
            echo "Name already exists. Please enter a different name"
            INVALID_NAME=0
            # runs until a new name was entered
            while [ "$INVALID_NAME" -eq 0 ]
            do
                read -p "Enter your name: " NAME
                if grep -Fxq "$NAME" $FOLDERNAME/names.txt
                then
                    echo "Name already exists. Please enter a different name"
                else
                    ((INVALID_NAME++))
                    echo $NAME >> "$FOLDERNAME/names.txt"
                    read -p "Name was written into the /names.txt file"
                fi
            done
        else
            echo $NAME >> "$FOLDERNAME/names.txt"
            read -p "Name was written into the /names.txt file"
        fi
    else
        echo 'You need to enter a valid foldername'
        create_name_list
    fi
}

# This function gives the user the option to use multiple functions.
# At the beginning we ask the user for the command he wants to use and if the given command is not found we restart the function. 
function retry() {
    read -p "Enter your option: " COMMANDUSER
    # ? NOTE: the whitespace after the [ is needed
    if [ "$COMMANDUSER" == "namelist" ]
    then
        create_name_list
        retry
    elif [ "$COMMANDUSER" == "backup" ]
    then
        backup
        retry
    elif [ "$COMMANDUSER" == "flip a coin" ]
    then
        ./flipacoin.sh
        read -p "Please press enter to continue"
        retry
    elif [ "$COMMANDUSER" == "help" ]
    then
        echo "List of commands:"
        echo "======================================="
        echo "- 'namelist': Writes the given name into a names.txt file inside the folder you gave when starting the command."
        echo "- 'backup': Creates a backup of all data inside the 'storage folder'."
        echo "- 'flip a coin': Flips a coin."
        echo "- 'quit': Closes the console."
        read -p "Please press enter to continue"
        retry
    elif [ "$COMMANDUSER" == "quit" ]
    then
        return
    else
        echo "Command not found. Please try again."
        retry
    fi
}

# Creates a backup folder if it does not already exist and copies all content of storage.
# The function also gives the user to clear all content of the backup folder first.
function backup() {
    if [ ! -d "backup" ]
    then
        mkdir backup
    fi
    read -p "Do you want to clear the backup folder first? (Y/N)" OPTION
    if [ $OPTION == "Y" ]
    then
        rm -rf backup/*
    fi
    cp -r storage/ backup/
}

###
# Main body of script starts here
###
echo "Welcome to this little shellscript."
echo "Developed by Palma Andrè."
echo "Enter 'help' to see a list of commands or press 'Strg+C' to close the console."

retry