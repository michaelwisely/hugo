# Description:
#   Fancy text with figlet
#
# Configuration:
#   None
#
# Commands:
#   hugo figlet me <text>
#

figlet = require 'figlet'

module.exports = (robot) ->

  robot.respond /figlet me (.*)/i, (msg) ->
    text = msg.match[1]
    figlet text, (err, data) ->
      if err
        msg.reply "I couldn't figlet that :C"
      else
        msg.reply "\n" + data
