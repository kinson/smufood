'use strict';

var express = require('express');
var app = express();
var cheerio = require('cheerio');
var request = require('request');
var exec = require('child_process').exec;

var reg = {
    status: 0,
    data: {
        schedule: {
            macs: {
                open: "11am",
                close: "12am"
            },
            arnold: {
                open: "7am",
                close: "10pm"
            },
            umph: {
                open: "7am",
                close: "8pm"
            },
            chickfila: {
                open: "8am",
                close: "3pm"
            },
            cafe100: {
                open: "7:30am",
                close: "8pm"
            },
            subway: {
                open: "8am",
                close: "4pm"
            },
            pizzahut: {
                open: "10:30am",
                close: "4pm"
            },
            esmucho: {
                open: "10:30am",
                close: "3pm"
            },
            sushic: {
                open: "10:30am",
                close: "3pm"
            },
            market: {
                open: "9am",
                close: "11pm"
            },
            einsteins: {
                open: "8am",
                close: "4:30pm"
            },
            pod: {
                open: "8am",
                close: "8pm"
            },
            smuothies: {
                open: "closed",
                close: "closed"
            },
            facultyclub: {
                open: "11am",
                close: "2pm"
            }
        }
    }
};
var thur = {
    status: 0,
    data: {
        schedule: {
            macs: {
                open: "11am",
                close: "12am"
            },
            arnold: {
                open: "7am",
                close: "10pm"
            },
            umph: {
                open: "7am",
                close: "8pm"
            },
            chickfila: {
                open: "8am",
                close: "3pm"
            },
            cafe100: {
                open: "7:30am",
                close: "8pm"
            },
            subway: {
                open: "10:30am",
                close: "4pm"
            },
            pizzahut: {
                open: "10:30am",
                close: "4pm"
            },
            esmucho: {
                open: "10:30am",
                close: "3pm"
            },
            sushic: {
                open: "10:30am",
                close: "3pm"
            },
            market: {
                open: "9am",
                close: "11pm"
            },
            einsteins: {
                open: "7:30am",
                close: "4:30pm"
            },
            pod: {
                open: "8am",
                close: "8pm"
            },
            smuothies: {
                open: "closed",
                close: "closed"
            },
            facultyclub: {
                open: "11am",
                close: "2pm"
            }
        }
    }
};
var fri = {
    status: 0,
    data: {
        schedule: {
            macs: {
                open: "6pm",
                close: "10pm"
            },
            arnold: {
                open: "7am",
                close: "7pm"
            },
            umph: {
                open: "7am",
                close: "2pm"
            },
            chickfila: {
                open: "8am",
                close: "3pm"
            },
            cafe100: {
                open: "7:30am",
                close: "3pm"
            },
            subway: {
                open: "10:30am",
                close: "4pm"
            },
            pizzahut: {
                open: "10:30am",
                close: "4pm"
            },
            esmucho: {
                open: "10:30am",
                close: "3pm"
            },
            sushic: {
                open: "10:30am",
                close: "3pm"
            },
            market: {
                open: "9am",
                close: "11pm"
            },
            einsteins: {
                open: "7:30am",
                close: "2:00pm"
            },
            pod: {
                open: "8am",
                close: "2pm"
            },
            smuothies: {
                open: "closed",
                close: "closed"
            },
            facultyclub: {
                open: "11am",
                close: "2pm"
            }
        }
    }
};

var getUrl = function(callback) {
    request.get("http://www.campusdish.com/en-US/CSSW/SouthernMethodist/LocationsMenus/Hours.htm", function(err, res, body) {
        var $ = cheerio.load(body);
        var url = 'http://www.campusdish.com' + $('font:contains("October 2014")').closest('a').attr('href');
        callback(url);
    });
};

// routes
app.use(express.static(__dirname + '/public/_site'));
app.get('/schedule', function(req, res) {
    var day = new Date().getDay();
    if(day >= 1 && day < 4) {
        res.json(reg);
    }
    if(day === 4){
        res.json(thur);
    }
    if(day === 5) {
        res.json(fri);
    }
    else {
        res.json(reg);
    }
});
app.post('/redeploy', function(req, res) {
    res.send();
    exec('make', function(err, stdout, stderr) {
        if(err) {
            console.err(err);
        }
        if(stdout) {
            console.log(stdout);
        }
        if(stderr) {
            console.err(stderr);
        }
    });
});

app.listen(80, function() {
    console.log('server online');
});
