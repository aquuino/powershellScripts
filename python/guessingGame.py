##Basic Python Guessing Game | Written 2021-01-30 ##

#Gives the user 3 guesses to guess a randomly generated number from 1-10

from random import randrange

#Generates Random Number
guessingNumber = int((randrange(10)))

#Begin guessing
guess = int(input("Guess a number from 1-10: "))
#While loop that exits when the number is guessed correctly | Or if you reach 3 tries
i = 1
while i < 3 :

    if guess == guessingNumber :
        break
    elif guess != guessingNumber :
        guess = int(input ("You guesssed wrong / Guess again: "))
    i += 1

    if i == 3 :
        break

#End Result Statements
if guess == guessingNumber :
    print ("You Got it Right!")
elif i ==3 :
    print ("You have run out of guesses~ Try Again ~")
