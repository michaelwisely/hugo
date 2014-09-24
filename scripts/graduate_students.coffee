# Description:
#   Tell us how you really feel, hubot
#
# Configuration:
#   None
#
# Commands:
#   hubot who's the worst? - Tell us how you really feel, hubot
#


module.exports = (robot) ->

  robot.respond /who's the worst/i, (msg) ->
    msg.reply "http://i.imgur.com/hys3YhQ.gif"
