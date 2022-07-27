
type GameResult* = enum
    playerWon, botWon, draw


proc play*(humanchoice, botchoice: string): GameResult =
    
    var possible_choice = ["Rocks", "Papers", "Scissors"]

    if humanchoice in possible_choice:
        if humanchoice == "Rocks" and botchoice == "Papers":
            return botWon
        elif humanchoice == "Rocks" and botchoice == "Scissors":
            return playerWon
        elif humanchoice == "Rocks" and botchoice == "Rocks":
            return draw
        elif humanchoice == "Papers" and botchoice == "Scissors":
            return botWon
        elif humanchoice == "Papers" and botchoice == "Rocks":
            return playerWon
        elif humanchoice == "Papers" and botchoice == "Papers":
            return draw
        elif humanchoice == "Scissors" and botchoice == "Rocks":
            return botWon
        elif humanchoice == "Scissors" and botchoice == "Papers":
            return playerWon
        else:
            return draw



#       return "Pick your choice (Rocks, Papers, Scissors)"
#        var humanchoice = readLine(stdin)
#        randomize()
#        var botchoice = sample(possible_choice)