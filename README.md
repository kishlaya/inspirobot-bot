# InspiroBot Bot

[InspiroBot](http://inspirobot.me/) is an artificial intelligence which can generate unlimited amounts of unique inspirational quotes.

For getting one of these quotes, you need to go to their website and click on generate again and again. So, I thought, let's make a bot to do that. I went through their source code to extract the underlying API and make use of it to develop this mini bot which can download as many quotes as you want.

Along with, I have also documented the InspiroBot API, for anybody else to use.

## Bot Usage

1. `git clone https://github.com/kishlaya/inspirobot-bot.git`
2. `cd inspirobot-bot`
3. `npm install`
4. `npm run compile`

And now you're ready to download images

5. `node lib/inspirobot.js X`

### Mindfulness Music Bot Usage

Run the steps 1-4 as above and replace the 5th step with

5. `node lib/inspirobot-mindfulness.js X`

Note: Here *X* denotes the number of quotes you want to download. Enter -1 for unlimited quotes. Also, all the images will be saved in the directory from wherever you execute the script.


## API Docs

The API is fairly simple.

`/api?generate=true` returns back another url for the newly generated quote.

But hold on. That's not yet. They also have special quotes for Christmas. Yay!!!

`/api?generate=true&season=xmas` returns back a url to a special Christmas generated quote

### Mindfulness Mode

`/api?getSessionID=1` will generate a unique session ID, using which we will use to generate the mindful data

`/api?generateFlow=1&sessionID=<generated_session_id>` will return the mindful data.

Here's an example of the data returned:
```json
  {
    "data": [
      {
        "duration": 2,
        "image": "IMAGE_CODE",
        "type": "transition",
        "time": 0
      },
      {
        "duration": 1.7,
        "text": "QUOTE HERE",
        "type": "quote",
        "time": 6
      },
      {
        "type": "stop",
        "time": 10
      }
    ],
    "mp3": "mp3_url"
  }
```

* `mp3` has the url to the mindful sound
* `data` contains the structure of the mindful sound
* `data.type` can be -
    * `transition` specifies the transition between two consecutive mindful quotes. Consequently, this block will also contain the key `image` which has the iMAGE_CODE to the background image. The IMAGE_CODE can be used to download the image using the following url - https://source.unsplash.com/IMAGE_CODE/1600x900
    * `quote` is the decoded form of  the voice currently playing the background. The decoded quote can be retrieved from the `text` field.
    * `stop` specifies the end of the current mindful sound.
