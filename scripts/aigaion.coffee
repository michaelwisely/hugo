# Description:
#
#   A reminder of bygone times.
#
# Commands:
#
#   hubot is aigaion up? - Displays the state of our Aigaion instance
#
# Configuration:

module.exports = (robot) ->

  robot.respond /is aigaion up?/i, (msg) ->
    msg.send "Ding dong, the witch is dead!"
