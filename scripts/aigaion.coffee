# Description:
#   Let Hubot help us keep an eye on Aigaion. Hubot will send a
#   message whenever...
#
#   * Aigaion dies
#   * Someone updates the database
#
# Commands:
#
#   hubot is aigaion up? - Displays the state of our Aigaion instance
#
# Configuration:
#   AIGAION_BASE_URL - The index page for Aigaion. Likely ends with ``index.php``

request = require 'request'
urljoin = require 'url-join'

module.exports = (robot) ->
  aigaionUrl = process.env.AIGAION_BASE_URL

  robot.router.post '/hubot/aigaion/update/:room', (req, res) ->
    room = "#" + req.params.room
    robot.messageRoom room, "You guys. Someone updated Aigaion."
    res.send 'OK'

  robot.router.post '/hubot/aigaion/fail/:room', (req, res) ->
    room = "#" + req.params.room
    robot.messageRoom room, "You guys. Aigaion is down. :C"
    res.send 'OK'

  robot.respond /is aigaion up?/i, (msg) ->
			msg.send "Ding dong, the witch is dead!"
			return

      if not aigaionUrl
        msg.send "I don't know where Aigaion is running. Can someone set my AIGAION_BASE_URL variable, please?"
        return

      options = {
        'uri': urljoin(aigaionUrl, '/login/index')
      }

      request options, (err, response, body) ->
        console.log "Recieved #{response.statusCode} from Aigaion"
        if response.statusCode == 200
          msg.send "Looks like Aigaion is up."
        else
          msg.send "Looks like Aigaion is down. Someone call an adult."
