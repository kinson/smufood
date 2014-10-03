var app = require('express')();

app.get('/schedule', function(req, res) {
	res.json({
		status: 0,
		data: {
			schedule: {
                macs: {
                    open: "6pm",
                    close: "11pm"
                },
                arnold: {
                    open: "6am",
                    close: "10pm"
                },
                umph: {
                    open: "6am",
                    close: "8pm"
                },
                chickfila: {
                    open: "8am",
                    close: "7pm"
                },
                cafe100: {
                    open: "6am",
                    close: "10pm"
                },
                subway: {
                    open: "8am",
                    close: "7pm"
                },
                pizzahut: {
                    open: "8am",
                    close: "7pm"
                },
                esmucho: {
                    open: "11am",
                    close: "7pm"
                },
                sushic: {
                    open: "11am",
                    close: "7pm"
                },
                market: {
                    open: "8am",
                    close: "12am"
                },
                einsteins: {
                    open: "6am",
                    close: "10pm"
                },
                pod: {
                    open: "6am",
                    close: "10pm"
                },
                smuothies: {
                    open: "8am",
                    close: "6pm"
                },
                facultyclub: {
                    open: "11am",
                    close: "2pm"
                }
            }
		}
	});
});

app.listen(80, function() {
    console.log('server online');
});