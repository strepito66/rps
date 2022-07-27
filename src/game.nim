import fusion/matching
from strutils import toLower

{.experimental: "caseStmtMacros".}

type GameResult* = enum
    playerWon, botWon, draw, invalidMove


proc play*(humanchoice, botchoice: string): GameResult =
    let humanchoice = humanchoice.toLower

    var possible_choice = ["rocks", "papers", "scissors"]

    return if humanchoice in possible_choice:
        case [humanchoice, botchoice]:
            of ["rocks", "Papers"],
                ["papers", "Scissors"],
                ["scissors", "Rock"]:
                    botWon
            of ["papers", "Rocks"],
                ["scissors", "Papers"],
                ["rock", "Scissors"]:
                    playerWon
            else:
                draw
    else:
        invalidMove

#       return "Pick your choice (Rocks, Papers, Scissors)"
#        var humanchoice = readLine(stdin)
#        randomize()
#        var botchoice = sample(possible_choice)
