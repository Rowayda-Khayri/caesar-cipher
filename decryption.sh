#!/bin/bash

# ###Decryption### #

# take ciphertext input
read -p "Enter a ciphertext to be decrypted: " ciphertext

# letters array
letters=('a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z')

# split ciphertext string in array so that i can loop over it

declare -a ciphertextArray

for ((i=0; i<${#ciphertext}; i++)); 
do 
        ciphertextArray[$i]="${ciphertext:$i:1}";
done

# ciphertext without special characters, numbers and spaces
lettersOnlyCiphertext='' # to be the input to count each letter frequency

# add only letters to lettersOnlyCiphertext variable

for (( i=0; i<${#ciphertext}; i++ )) 
do
        #check if character is a letter not any other character or space
        if [[ $(printf "_[%s]_" "${letters[@]}") =~ .*_\[${ciphertextArray[$i]}\]_.* ]];
        then
                # add character as it is to lettersOnlyCiphertext variable
                lettersOnlyCiphertext="${lettersOnlyCiphertext}${ciphertextArray[$i]}"
        fi

done



<<'C'



C
