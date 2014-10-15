# Description:
#   Decides where we're going to go for lunch
# Configuration:
#   None

module.exports = (robot) ->

  robot.hear /^(hugo(o+))$/i, (msg) ->
    extraLetters = msg.match[2].length
    response = "Wha"
    for i in [1..extraLetters]
      response += "a"
    response += "t"

    if extraLetters > 10
      response = response.toUpperCase()

    if extraLetters > 25
      response += "?!"

    msg.reply response
