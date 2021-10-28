#! /bin/bash

# create name list
function create_name_list() {
    # reads input and writes it to the file
    read -p "Enter your name: " NAME
    # creates Folder if string was entered after the cmd
    if [[ $1 ]]
    then
        if grep -Fxq "$NAME" $1/names.txt
        then
            read -p "Name already exists. Press enter to continue"
            create_name_list $1
        else
            mkdir storage
            echo $NAME >> "$1/names.txt"
            read -p "Name was written into the /names.txt file"
        fi
    # if no string was give it creates/writes into default "storage" folder
    else
        # check if entered name already exists
        if grep -Fxq "$NAME" storage/names.txt
        then
            read -p "Name already exists. Press enter to continue"
            create_name_list
        else
            mkdir storage
            echo $NAME >> "storage/names.txt"
            read -p "Name was written into the /names.txt file"
        fi
    fi
}

# here we decide which function we call trough user input
function retry() {
    read -p "Enter your option: " COMMANDUSER
    # ? WHITESPACE AFTER [ IS NEEDED
    if [ "$COMMANDUSER" == "names" ]
    then
        read -p "Enter in what folder you want to write: " FOLDERNAME
        mkdir "$FOLDERNAME"
        create_name_list "$FOLDERNAME"
    else
        read -p "Command not found"
        retry $1
    fi
}

# we call the code above inside a function so we can call it again if it ends with error
# ? $1 is the given string after calling the command inside a terminal
# retry "$1"
retry