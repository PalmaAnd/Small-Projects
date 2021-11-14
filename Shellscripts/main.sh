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

# here we decide which function we call trough user input
function retry() {
    read -p "Enter your option: " COMMANDUSER
    # ? NOTE: the whitespace after the [ is needed
    if [ "$COMMANDUSER" == "namelist" ]
    then
        create_name_list
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
        echo "- 'flip a coin': Flips a coin."
        echo "- 'quit': Closes the console."
        read -p "Please press enter to continue"
        retry
    elif [ "$COMMANDUSER" == "quit" ]
    then
        return
    else
        read -p "Command not found. Please press enter to go back."
        retry
    fi
}

echo "Welcome to this little shellscript."
echo "Developed by Palma Andrè."
echo "Enter 'help' to see a list of commands or press 'Strg+C' to close the console."

# we call the code above inside a function so we can call it again if it ends with error
# ? $1 is the given string after calling the command inside a terminal
# retry "$1"
retry