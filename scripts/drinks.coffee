# Description:
#   Decides where we're going to get drunk
#
# Commands:
#   hubot where are we going for drinking - chooses where you're going for drinks
#
# Configuration:
#   None

module.exports = (robot) ->
  locations = ['grotto', 'el mags', 'public house', 'speakeasy', 
    'locker room', 'buffalo wild wings', 't-patch', 'somewhere else',
    'benton square', 'los arcos mezcal bar', 'mark\'s apartment']

  picker = (msg) ->
    place = locations[Math.floor(Math.random() * locations.length)]
    msg.reply "How about going to \"#{place}\"?"

  robot.respond /where are we going for drinks/i, picker
  robot.respond /i'm thirsty/i, picker
  robot.respond /me so thirsty/i, picker
  robot.respond /am sober/i, picker
  robot.respond /am soober/i, picker
  robot.respond /I'm thinking too clearly/i, picker
  robot.respond /my brain too smart/i, picker
