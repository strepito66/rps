import htmlgen
import jester
import random
import game
import handler
import handlers/[health,play,string]

var possible_choice = ["Rocks", "Papers", "Scissors"]


routes:
  get "/":
    resp h1("Hello world")
  get "/play":
    resp h1("404")
  get "/play/@humanchoice":
    randomize()
    var botchoice = sample(possible_choice)
    var humanchoice = @"humanchoice"
    var status = play(humanchoice, botchoice)
    if status == botWon:
      resp h1("The bot won the game")
    elif status == playerWon:
      resp h1("You won the game")
    else:
      resp h1("Draw!")


  #API#
  get "/api/health":
    json_response(Http200, health.get_health())
  get "/api/botchoice":
    randomize()
    var botchoice = sample(possible_choice)
    json_response(Http200, play.check(botchoice))
  get "/api/play/@humanchoice":
    randomize()
    var botchoice = sample(possible_choice)
    var humanchoice = @"humanchoice"
    var status = play(humanchoice, botchoice)
    if status == botWon:
      json_response(Http200, string.customtext(botchoice, "The bot won the game"))
    elif status == playerWon:
      json_response(Http200, string.customtext(botchoice, "You won the game"))
    else:
      json_response(Http200, string.customtext(botchoice, "Draw!"))
