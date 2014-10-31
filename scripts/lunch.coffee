# Description:
#   Decides where we're going to go for lunch
#
# Commands:
#   hubot where are we going for lunch - chooses where you're going for lunch
#
# Configuration:
#   None

module.exports = (robot) ->
  locations = ['atc', 'thai', 'grotto', 'mottomo', 'los casadores',
    'el mags', 't-patch', 'randys', 'nature girls', 'leonas',
    'pizza inn', 'pryors', 'alexs', 'penelopes',
    'campus perk', 'maid rite', 'bandanas', 'odoggys']

  picker = (msg) ->
    place = locations[Math.floor(Math.random() * locations.length)]
    msg.reply "How about going to \"#{place}\"?"

  robot.respond /where are we going for lunch/i, picker
  robot.respond /i'm hungry/i, picker
  robot.respond /me so hungy/i, picker
  robot.respond /am HANGRY/i, picker
