#!/bin/bash

# ###Decryption### #

# take ciphertext input
read -p "Enter a ciphertext to be decrypted: " ciphertext

# letters array
letters=('a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z')

# split ciphertext string in array so that i can loop over it

declare -a ciphertextArray

for ((i=0; i<"${#ciphertext}"; i++)); do
        ciphertextArray[$i]="${ciphertext:$i:1}";
done

# ciphertext without special characters, numbers and spaces
lettersOnlyCiphertext='' # to be the input to count each letter frequency

# add only letters to lettersOnlyCiphertext variable

for (( i=0; i<"${#ciphertext}"; i++ )); do
        #check if character is a letter not any other character or space
        if [[ $(printf "_[%s]_" "${letters[@]}") =~ .*_\["${ciphertextArray[$i]}"\]_.* ]]; then
                # add character as it is to lettersOnlyCiphertext variable
                lettersOnlyCiphertext="${lettersOnlyCiphertext}${ciphertextArray[$i]}"
        fi

done

# define function to calculate each letter's frequency percentage

calculatePercentage () { # parameters: $count, $total


echo "count is $1"
echo "total is $2"
        #letterPercentage=$(( 100*{$1}/{$2} )) # to be returned
        letterPercentage=$(( 100 * $1 / $2 )) # to be returned
#	letterPercentage=20
echo "percentage is $letterPercentage "
}

#lettersFrequencyPercentages=() # to store each letter's frequency percentage
declare -a lettersFrequencyPercentages

# calculate each letter's frequency percentage

numberOfLettersInCiphertext="${#lettersOnlyCiphertext}"

echo "numberOfLettersInCiphertext is $numberOfLettersInCiphertext"

echo "lettersOnlyCiphertext is $lettersOnlyCiphertext"


for ((i=0; i<"${#letters[@]}"; i++)); do


        # get letter occurence in ciphertext
#        count="$lettersOnlyCiphertext" | sed -e 's/\(.\)/\n/g' | grep "${letters[$i]}" | wc -l
#	count=awk -F"${letters[$i]}" '{print NF-1}' <<< "${lettersOnlyCiphertext}"
	echo "new count is $count "
        # set count to 0 if is empty
        if [[ -z "$count" ]]; then
                count=0
                echo "count was empty"
        fi

        total="$numberOfLettersInCiphertext"
        calculatePercentage "${count}" "${total}"

        lettersFrequencyPercentages["$i"]="${letterPercentage}"; # add letter percentage to percentages array
done

echo "${lettersFrequencyPercentages[@]}"

<<'C'

# calculate each letter's frequency percentage

numberOfLettersInCiphertext = len(lettersOnlyCiphertext)

for letter in letters:
    lettersFrequencyPercentages.append(percentage(lettersOnlyCiphertext.count(letter), numberOfLettersInCiphertext))


C
