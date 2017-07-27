var request = require('request');
var fs = require('fs');
var num = (process.argv.length > 2 ? process.argv[process.argv.length - 1] : void 0) || 1;

function getImage(counter) {
    if (counter === 0)
        return;

    request.get("http://inspirobot.me/api?generate=true", function(err, res, imageurl) {
		if (err)
            throw err;
		request.get({url: imageurl, encoding: 'binary'}, function(err2, res2, image) {
			if (err2)
                throw err2;
			filename = imageurl.substring(imageurl.lastIndexOf('/')+1);
			fs.writeFile(filename, image, 'binary', function(err3) {
				if (err3)
                    throw err3;
				console.log("Saved file: " + filename);
				getImage(counter-1);
			});
		});
	});
}

getImage(parseInt(num));
