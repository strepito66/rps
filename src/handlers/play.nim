import marshal, chronicles

type
  ChoiceCheck = object
    choice: string

proc check*(botchoice: string): string =
    info "checked botchoice"
    var check = ChoiceCheck(choice: botchoice)
    return $$check