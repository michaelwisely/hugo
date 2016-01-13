# Description:
#   Save phrases for later
#
# Configuration:
#   None
#
# Commands:
#   hubot let "<shortcut>"="<phrase>" - save a phrase
#   hubot let "<shortcut>"= - delete a phrase
#   <shortcut> - print the matching phrase

module.exports = (robot) ->

  robot.respond /let \"(.*)\"=\"(.*)\"/i, (msg) ->
    phrases = robot.brain.get('phrases') or {}
    phrases[msg.match[1].trim()] = msg.match[2].trim()
    robot.brain.set 'phrases', phrases

  robot.hear /(.*)/i, (msg) ->
    phrases = robot.brain.get('phrases') or {}
    phrase = phrases[msg.match[1].trim()]
    if phrase? and phrase != ""
      msg.reply phrase
