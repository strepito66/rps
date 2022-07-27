# Package

version       = "0.1.0"
author        = "strepito"
description   = "A new awesome nimble package"
license       = "WTFPL"
srcDir        = "src"
bin           = @["rps", "/bot/bot"]


# Dependencies

requires "nim >= 1.6.6"
requires "jester >= 0.5.0"
requires "chronicles >= 0.4.2"
requires "fusion"
requires "telebot"
