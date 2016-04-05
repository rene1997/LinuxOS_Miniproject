// fmon version 2 - (Mains Frequency Monitoring API)
var express = require('express');
var router = express.Router();
var jwt = require('jwt-simple');
//var sqlite3 = require('sqlite3').verbose();
var path = require('path');
var mysql = require('mysql');
//
// Alle endpoint behalve /apiv2/login require X-Access-Token
//
// Ook kan (weg laten van newRegExp): 
//      router.all(/[^(\/login)]/, function (req, res, next) 
// Let op ! zonder ' (quotes)
//

router.all( new RegExp("[^(\/login)]"), function (req, res, next) {

    // Zonder reguliere expressie een if gebruiken om router eruit
    // te filteren:
    // if( req.url.indexOf('/login') > -1) {
    //     return next();
    // }

    // For all the others
    var token = (req.header('X-Access-Token')) || ''; 
    if (token) {
        try {
            var decoded = jwt.decode(token, req.app.get('secretkey'));

            // Check if token is from known user
            // to do: db lookup
            var userName = req.app.get('username')
			console.log(userName);
			console.log(decoded.iss);
            if (decoded.iss == userName) {
                req.app.set("userid", decoded.iss);
                console.log("Userid: " + req.app.get('userid'));
                return next();
            }
            else {
                res.status(401);
                res.json({
                    "status": 401, "message": "unknown userid, bye"
                });
            }
        }
        catch (err) {
            console.log("Authorization failed: " + err);
        }
    }

    res.status(401);
    res.json({
        "status": 401, "message": "unknown userid, bye"
    });
});


// Restfull login
router.post('/login', function (req, res) {

    var username = req.body.username || '';
    var password = req.body.password || '';

    // do db lookup
    var loginName = req.app.get('username');
    var loginPass = req.app.get('password');

    // Check for empy body
    if (username == '' || password == '') {
        res.status(401);
        res.json({
            "status": 401,
            "message": "Unknown USER, bye"
        });
        return;
    }

    // Check for valid user/passwd combo
    if ((username == loginName) && (password == loginPass)) {
        var now = new Date();
        var expires = now.setHours(now.getDay() + 10);
        var token = jwt.encode({
            iss: username,
            exp: expires
        }, req.app.get('secretkey'));

        res.status(200);
        res.json({
            token: token,
            expires: expires,
            user: username
        });
    }
    else {
        res.status(401);
        res.json({
            "status": 401,
            "message": "Unknown USER, bye"
        });
    }
});

/*
FUNCTIONS
getpowerstatus - get current power status (on or off)
postpower - post the power status (on or off)
get7days - get power statusses of last 7 days
gettoday - get power statusses of today
*/

// Get power status
router.get('/getpowerstatus', function (req, res) {
	//start mysql verbinding
	var connection = mysql.createConnection({
	  host     : req.app.get('localhost'),
	  user     : req.app.get('dbuser'),
	  password : req.app.get('dbpassword'),
	  database : req.app.get('dbname')
	});

	connection.connect();

	connection.query('SELECT * FROM power ORDER BY idpower DESC limit 1', function(err, rows, fields) {
		if (err) throw err;

		console.log(rows);
		res.status(200);

		res.json(rows);
	});
	
	connection.end();
});

// Post power on or off
router.post('/postpower', function (req, res) {
	//start mysql verbinding
	var connection = mysql.createConnection({
	  host     : req.app.get('localhost'),
	  user     : req.app.get('dbuser'),
	  password : req.app.get('dbpassword'),
	  database : req.app.get('dbname')
	});

	connection.connect();
	var power = req.body.power || '';

	connection.query('INSERT INTO power (power) VALUES (?)', power, function(err, rows, fields){
		if (err) throw err;

		console.log(rows);
		res.status(200);

		res.json(rows);
	});

	connection.end();
});

// Get 7 days
router.get('/get7days', function (req, res) {

	//start mysql verbinding
	var connection = mysql.createConnection({
	  host     : req.app.get('localhost'),
	  user     : req.app.get('dbuser'),
	  password : req.app.get('dbpassword'),
	  database : req.app.get('dbname')
	});

	connection.connect();

	connection.query('SELECT * FROM power WHERE time > DATE_ADD(NOW(),INTERVAL -1 WEEK) ORDER BY time', function(err, rows, fields) {
		if (err) throw err;

		console.log(rows);
		res.status(200);

		res.json(rows);
	});
	
	connection.end();
});

// Get today
router.get('/gettoday', function (req, res) {

	//start mysql verbinding
	var connection = mysql.createConnection({
	  host     : req.app.get('localhost'),
	  user     : req.app.get('dbuser'),
	  password : req.app.get('dbpassword'),
	  database : req.app.get('dbname')
	});

	connection.connect();

	connection.query('SELECT * FROM power WHERE DATE(time) = CURDATE() ORDER BY time', function(err, rows, fields) {
		if (err) throw err;

		console.log(rows);
		res.status(200);

		res.json(rows);
	});
	
	connection.end();
});

// Fall back, display some info
router.get('/', function (req, res) {
    res.status(200);
    res.json({
        "description": "Project by Davey Mathijssen and René Keijzer."
    });
});


module.exports = router;