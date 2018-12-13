fs = require 'fs'
request = require 'request'
num = (process.argv[process.argv.length - 1] if process.argv.length > 2) || 1

getImage = (counter) ->
    return if counter == 0
    request
        .get 'http://inspirobot.me/api?generate=true'
        .on 'data', (data) ->
            image_url = data.toString()
            image_name = image_url.split('/').pop()
            console.log image_name
            request image_url
                .pipe fs.createWriteStream image_name
            getImage counter-1
        .on 'error', (err) ->
            console.error err

getImage parseInt num
