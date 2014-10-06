var app = require('express')();
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
                close: "5pm"
            },
            cafe100: {
                open: "7:30am",
                close: "8pm"
            },
            subway: {
                open: "8am",
                close: "7pm"
            },
            pizzahut: {
                open: "10:30am",
                close: "7pm"
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
                close: "6:30pm"
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
                open: "5pm",
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
                close: "4pm"
            },
            einsteins: {
                open: "7:30am",
                close: "2pm"
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


app.get('/schedule', function(req, res) {
    var day = new Date().getDay();
    if(day >= 1 && day < 5) res.json(reg);
    if(day === 5) res.json(fri);
    else res.json(reg);
});

app.listen(80, function() {
    console.log('server online');
});