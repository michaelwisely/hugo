# Description:
#   Fancy text with figlet
#
# Configuration:
#   None
#
# Commands:
#   hugo figlet me <text>
#   hugo using <font> figlet me <text>
#

figlet = require 'figlet'

module.exports = (robot) ->

  robot.respond /(using (.*) )?figlet me (.*)/i, (msg) ->
    font = msg.match[2] or 'Standard'
    text = msg.match[3]
    figlet text, font: font, (err, data) ->
      if err
        msg.reply "I couldn't figlet that :C"
      else
        msg.reply "\n" + data
