##Python Dice Rolling Game | Written 2021-01-30


from random import randrange

i = 0
while  i == 0 :
    question = input ("Would you like to roll the Dice? Y/N: ")

    if question == "Y" :
        print (randrange(6))
    if question == "N" :
        break

print ("Goodbye")


