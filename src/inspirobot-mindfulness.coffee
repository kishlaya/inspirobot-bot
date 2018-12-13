fs = require 'fs'
request = require 'request'
num = (process.argv[process.argv.length - 1] if process.argv.length > 2) || 1
sessionID = null;

setSessionID = (callback) ->
  request
    .get 'http://inspirobot.me//api?getSessionID=1'
    .on 'data', (data) ->
      sessionID = data.toString()
      callback parseInt num

getMusic = (counter) ->
    return if counter == 0
    request ('http://inspirobot.me/api?generateFlow=1&sessionID=' + sessionID), (error, res, body) ->
        if error
          console.log error
        else
          data = JSON.parse body
          mp3_url = data.mp3
          mp3_name = mp3_url.split('/').pop()
          console.log mp3_name
          request mp3_url
              .pipe fs.createWriteStream mp3_name
        getMusic counter-1

setSessionID getMusic
