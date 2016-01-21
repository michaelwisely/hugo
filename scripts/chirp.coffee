# Description
#   What's that? A cricket?
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
module.exports = (robot) ->

  chirp_timeout = null

  robot.hear /(?:.*)/i, (msg) ->
    if chirp_timeout?
      clearTimeout chirp_timeout

    cb = () ->
      msg.send "/me makes cricket sound"

    # Set 2 hour timeout
    chirp_timeout = setTimeout cb, 1000 * 60 * 60 * 2
