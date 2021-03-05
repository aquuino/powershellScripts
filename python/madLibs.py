###Mad Libs | Written 2021-01-31###


i=1
while i < 10 :

    #Take user input
    noun  = input("Enter a noun: ")
    pnoun = input("Enter a plural noun: ")
    noun2 = input("Enter a second noun: ")
    place = input("Enter a place: ")
    adjective = input ("Enter an adjective: ")
    noun3 = input("Enter a third noun: ")

#Display the MadLib
    print ("------------------------------------------")
    print ("Be kind to your",noun,"- footed", pnoun)
    print ("For a duck may be somebody's", noun2,",")
    print ("Be kind to your",pnoun,"in",place)
    print ("Where the weather is always",adjective,".")
    print ()
    print ("You may think that is this the",noun3,",")
    print ("Well it is.")
    print ("------------------------------------------")

    #loop
    i = i+1
