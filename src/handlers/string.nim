import marshal, chronicles

type
  textin = object
    result: string

type 
  custom = object
    bot_choice: string
    result: string


proc insert*(x: string): string =
    info "string inserter"
    var string = textin(result: x)
    return $$string
proc customtext*(x,y: string): string =
  info "custom result"
  var string = custom(bot_choice: x, result: y)
  return $$string