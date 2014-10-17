# Description:
#   Reacts to sad events
#
# Commands:
#   hubot <name> is dead
#
# Configuration:
#   None

module.exports = (robot) ->
  robot.respond /(.*) is dead/i, (msg) ->
    msg.reply "Oh no :C"
