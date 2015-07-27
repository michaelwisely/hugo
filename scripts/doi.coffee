# Description:
#   Resolves Digital Object Identifiers
#
# Commands:
#   <doi> - Go look up the DOI
#
# Configuration:
#   None

request = require 'request'

printURLs = (msg, doi, data) ->

  printURL = (data) ->
    url = switch data.format
      when 'string' then data.value
      else "I don't know how to decode a #{data.format} formatted URL... :/"
    msg.reply "\t - #{url}"

  msg.reply "I found the following URLs for doi:#{doi}"
  printURL value.data for value in data.values


module.exports = (robot) ->

  robot.hear /(?:doi:)?(10\.[0-9]{4,}(?:\.[0-9]+)*\/\S+)/, (msg) ->
    doi = msg.match[1]
    encodedDoi = encodeURIComponent doi
    options =
       'uri': "http://doi.org/api/handles/#{encodedDoi}?type=URL"

    request options, (err, response, body) ->
      if err
        console.log 'Request error. Could not look up DOI.'

      data = JSON.parse(body)

      switch data.responseCode
        when 2 then msg.reply "Something's wrong with the DOI proxy. (5XX)"
        when 100 then msg.reply "I couldn't find that DOI handle. (404)"
        when 200 then msg.reply "I found #{doi}, but it didn't have any values"
        when 1 then printURLs msg, doi, data
