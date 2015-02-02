# Description:
#   Decides where we're going to go for lunch
#
# Commands:
#   hubot where are we going for lunch - chooses where you're going for lunch
#
# Configuration:
#   None
fb = require 'fb'
fb.setAccessToken process.env.FB_API_TOKEN or ""

module.exports = (robot) ->
  locations = ['atc', 'thai', 'grotto', 'mottomo', 'los casadores',
    'el mags', 't-patch', 'randys', 'nature girls', 'leonas',
    'pizza inn', 'pryors', 'alexs', 'penelopes',
    'campus perk', 'maid rite', 'bandanas', 'odoggys']

  picker = (msg) ->
    place = locations[Math.floor(Math.random() * locations.length)]
    msg.reply "How about going to \"#{place}\"?"
    if not fb.getAccessToken()
      msg.reply "Can't communicate with Birdar."
      return
    fb.api 'ODOGGYS/feed', { fields: ['message', 'updated_time'], limit: 5 }, (res) ->
      for post in res["data"]
        if not post["message"]?
          continue
        if post["message"].match /bird ?dog/i
          msg.reply "Birdar: Bird Dog mentioned on #{post['updated_time']}."

  robot.respond /where are we going for lunch/i, picker
  robot.respond /i am hungry/i, picker
  robot.respond /me so hungy/i, picker
  robot.respond /am HANGRY/i, picker
