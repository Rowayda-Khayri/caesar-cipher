#!/bin/bash

# ### Encryption ### #

# take msg input
read -p "Enter a msg to be encrypted: " msg

# take shift key input
read -p "Enter a shift key: "  shiftKey

# letters array
letters=('a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z')

ciphertext="" # to store output

##------------##
## encryption ##
##------------##

# split msg string in array so that i cal loop over it

declare -a msgArray 

for ((i=0; i<${#msg}; i++)); 
do 
        msgArray[$i]="${msg:$i:1}";
done

# loop over all msg characters

for (( i=0; i<${#msg}; i++ )) 
do
        #check if character is a letter not any other character or space
        if [[ $(printf "_[%s]_" "${letters[@]}") =~ .*_\[${msgArray[$i]}\]_.* ]];
        then
                # get index of character in letters array
                for y in "${!letters[@]}"; do
                    if [[ "${letters[$y]}" = "${msgArray[$i]}" ]]; then
                        index=${y};
                    fi
                done

                # add character to ciphertext
                ciphertext="${ciphertext}${letters[$index + $shiftKey]}"

        else  #character isn't a letter (is special character, space or number)
                
                # add character as it is to ciphertext
                ciphertext="${ciphertext}${msgArray[$i]}"
                
        fi

done

#print ciphertext
echo $ciphertext