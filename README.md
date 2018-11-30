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

5. `npm start X`

Note: Here *X* denotes the number of quotes you want to download. Enter -1 for unlimited quotes. Also, all the images will be saved in the directory from wherever you execute the script.


## API Docs

The API is fairly simple.

`/api?generate=true` returns back another url for the newly generated quote.

But hold on. That's not yet. They also have special quotes for Christmas. Yay!!!

`/api?generate=true&season=xmas` returns back a url to a special Christmas generated quote
