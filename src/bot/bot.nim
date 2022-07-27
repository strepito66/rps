import telebot, asyncdispatch, logging, options, strutils
import std/json
import std/httpclient

proc apireq(x: string): Future[string] {.async.} =
  var client = newAsyncHttpClient()
  return await client.getContent("http://localhost:5000/api/play/" & x)

var L = newConsoleLogger(fmtStr="$levelname, [$time] ")
addHandler(L)

{.experimental: "caseStmtMacros".}


# remember to strip your secret key to avoid HTTP error
const API_KEY = strip(slurp("secret.key"))

proc updateHandler(b: Telebot, u: Update): Future[bool] {.async.} = 
  var response = u.message.get
  var texto = response.text.get
  var possible_choice = ["rocks", "papers", "scissors", "Rocks", "Papers", "Scissors"]
  if not u.message.isSome:
    # return true will make bot stop process other callbacks
    return true
  if texto == "/start":
    var text = "Nice, now send me your move! ( Rocks, Papers, Scissors)"
    discard await b.sendMessage(response.chat.id, text)
  if texto in possible_choice:
    var req = await apireq(texto)
    var json = parseJson(req)
    var text = json{"result"}.getStr()
    discard await b.sendMessage(response.chat.id, text)







let bot = newTeleBot(API_KEY)
bot.onUpdate(updateHandler)
bot.poll(timeout=300)
