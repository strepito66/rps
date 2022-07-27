

proc play*(humanchoice, botchoice: string): string =
    
    var possible_choice = ["Rocks", "Papers", "Scissors"]

    if humanchoice in possible_choice:
        if humanchoice == "Rocks" and botchoice == "Papers":
            return "The bot won the game"
        elif humanchoice == "Rocks" and botchoice == "Scissors":
            return "You won the game"
        elif humanchoice == "Rocks" and botchoice == "Rocks":
            return "Draw!"
        elif humanchoice == "Papers" and botchoice == "Scissors":
            return "The bot won the game"
        elif humanchoice == "Papers" and botchoice == "Rocks":
            return "You won the game"
        elif humanchoice == "Papers" and botchoice == "Papers":
            return "Draw!"
        elif humanchoice == "Scissors" and botchoice == "Rocks":
            return "The bot won the game"
        elif humanchoice == "Scissors" and botchoice == "Papers":
            return "You won the game"
        else:
            return "Draw!"



#       return "Pick your choice (Rocks, Papers, Scissors)"
#        var humanchoice = readLine(stdin)
#        randomize()
#        var botchoice = sample(possible_choice)