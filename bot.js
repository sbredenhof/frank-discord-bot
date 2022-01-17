/*
Frank the discord bot
version 0.2
by Sam B.
*/
// Require the necessary discord.js classes
const Discord = require('discord.js');
const client = new Discord.Client({
	partials: ['MESSAGE', 'CHANNEL', 'REACTION'],
	intents: [Discord.Intents.FLAGS.GUILDS, Discord.Intents.FLAGS.GUILD_MESSAGES],
});
const {
	token,
} = require('./config.json');

// when someone says something with no saved response, the bots message gets saved along with the user id, so that it can save the response to it
const userResponse = new Array();

// count the amount of words with no answer so it doesn't get too random.
let nullCount;
const nullMax = 5;

// When the client is ready, run this code (only once)
client.once('ready', () => {
	async function init() {
		const mysql = require('mysql2/promise');
		const connection = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: 'Sam12345678',
			multipleStatements: true,
		});

		// create the database with mysql, message must be unique.
		const createDBAndTables = `CREATE DATABASE IF NOT EXISTS frankMemory;
			use frankMemory;
			CREATE TABLE IF NOT EXISTS response (
			message varchar(255) unique,
			response1 varchar(30),
			response2 varchar(30),
			response3 varchar(30),
			score1 int,
			score2 int,
			score3 int,
			PRIMARY KEY (message));`;
		await connection.query(createDBAndTables);

		// creates a database if there isnt already one.
		const [rows] = await connection.query('SELECT * FROM response');
		// no records? Let's add a couple - for testing purposes
		if (rows.length == 0) {
			// no records, so let's add a couple
			const userRecords = 'insert into response (message, response1, response2, response3, score1, score2, score3) values ?';
			const recordValues = [
				['Hi', 'hello there!', 'hiii', 'hows it going', 1, 1, 1],
				['Hi!!', 'hello there!!!', 'hiii!!', 'hows it going?', 1, 1, 1],
				['Hello there', null, null, null, 0, 0, 0],
				['Knock Knock!', null, null, null, 0, 0, 0],
			];
			await connection.query(userRecords, [recordValues]);
		}
		console.log('Database created!');
	}
	init();
	const mysql = require('mysql2');
	const connection = mysql.createConnection({
		host: 'localhost',
		user: 'root',
		password: 'Sam12345678',
		database: 'frankMemory',
	});
	connection.query('SELECT * from response where response1 IS NULL', function (error, nullWords) {
		if (error) {
			console.log(error);
		}
		nullCount = nullWords.length;
		console.log('count null answers: ' + nullCount);
	});
	console.log('Ready!');
});

client.on('messageCreate', input => {
	// block loops
	if (!input.content.startsWith('!frank') || input.author.bot) return;
	const message = input.content.slice(7, 262).toLowerCase().trim();
	let response = 'hi';
	const mysql = require('mysql2');
	const connection = mysql.createConnection({
		host: 'localhost',
		user: 'root',
		password: 'Sam12345678',
		database: 'frankMemory',
	});

	connection.connect();

	connection.query(
		'SELECT * FROM response where message = ?', [message],
		function (error, results) {
			if (error) {
				console.log(error);
			}

			// save response to last unknown
			// runs if the program is expecting a response
			if (userResponse[parseInt(input.author.id)]) {
				let whichResponse = 1;
				const lastInput = userResponse[parseInt(input.author.id)];
				connection.query(
					'SELECT * FROM response where message = ?', [lastInput],
					function (error5, results5) {
						if (error5) {
							console.log(error5);
						}

						// if a new answer is the same as a previous, add to the score
						if (results5[0].response1 == lastInput) {
							increaseScore(1, lastInput);
						} else if (results5[0].response2 == lastInput) {
							increaseScore(2, lastInput);
						} else if (results5[0].response3 == lastInput) {
							increaseScore(3, lastInput);
						} else {
							// if non are the same, change out one of the nulls.
							if (results5[0].response1 == null) {
								whichResponse = 1;
							} else if (results5[0].response2 == null) {
								whichResponse = 2;
							} else if (results5[0].response3 == null) {
								whichResponse = 3;
							}
							newWord(whichResponse);
						}
					},
				);
			}

			// if response exists
			if (results[0] != null && results[0].response1 != null) {
				known();
			} else {
				unknown();
			}


			// run if the message is already in the db
			function known() {
				// choose a random result based on the score of each response.
				const score1 = parseInt(results[0].score1);
				const score2 = parseInt(results[0].score2);
				const score3 = parseInt(results[0].score3);
				const total = score1 + score2 + score3;
				const random = Math.ceil(Math.random() * total);
				console.log(score1 + ' ' + score2 + ' ' + score3 + ' ' + total + ' ' + random);
				if (random <= score1) {
					response = results[0].response1;
				} else if (random <= (score1 + score2)) {
					response = results[0].response2;
				} else {
					response = results[0].response3;
				}
				input.reply(response);
				expectAnswer(response);
			}

			// run if message is not in the database
			function unknown() {
				connection.query(
					'SELECT * FROM response',
					function (error2, results2) {
						if (error2) {
							console.log(error2);
						}
						// check and see if there are too many null answers first before adding another.
						if (nullCount < nullMax) {
							try {
								const userRecords = 'insert ignore into response (message, response1, response2, response3, score1, score2, score3) values ?';
								const recordValues = [
									[message, null, null, null, 0, 0, 0],
								];
								connection.query(userRecords, [recordValues], function () {
									nullCount++;
									console.log(nullCount);
								});
							} catch (error4) {
								console.log(error4);
							}
						}
						// get a random answer that isnt full of response
						//	let i = 0;
						//	do {

						// get a random response to respond with.
						let i = Math.floor(Math.random() * results2.length);
						if (i == results2.length) {
							i--;
						}
						//	} while (results2[i].response1 != null && results2[i].response2 != null && results2[i].response3 != null);

						input.reply(results2[i].message);

						// save the response and the author to the array so the response to that can be saved to the db
						expectAnswer(results2[i].message);
					},
				);
			}

			// run to save a response to the database
			function newWord(responseNumber) {
				let sqlCode;
				try {
					if (responseNumber == 1) {
						sqlCode = 'update response SET response1 = ? where message = ?';
						connection.query('update response SET score1 = score1 + 1 where message = ?', [userResponse[parseInt(input.author.id)]], function () {
							nullCount--;
							console.log(nullCount);
						});
					} else if (responseNumber == 2) {
						sqlCode = 'update response SET response2 = ? where message = ?';
						connection.query('update response SET score2 = score2 + 1 where message = ?', [userResponse[parseInt(input.author.id)]]);
					} else {
						sqlCode = 'update response SET response3 = ? where message = ?';
						connection.query('update response SET score3 = score3 + 1 where message = ?', [userResponse[parseInt(input.author.id)]]);
					}
					connection.query(sqlCode, [message, userResponse[parseInt(input.author.id)]]);
				} catch (error2) {
					console.log(error2);
				}

				// clear the user from the array of messages once it is already added.
				userResponse[parseInt(input.author.id)] = null;
			}

			function expectAnswer(savedMessage) {
				if (nullCount <= nullMax) {
					userResponse[parseInt(input.author.id)] = savedMessage;
				} else {
					userResponse[parseInt(input.author.id)] = null;
				}
			}


			// increase the score of a response by one, using a certain message
			function increaseScore(responseNumber, atMessage) {
				let sqlCode;
				if (responseNumber == 1) {
					sqlCode = 'update response SET score1 = score1 + 1 where message = ?';
				} else if (responseNumber == 2) {
					sqlCode = 'update response SET score2 = score2 + 1 where message = ?';
				} else {
					sqlCode = 'update response SET score3 = score3 + 1 where message = ?';
				}
				connection.query(sqlCode, [atMessage]);
			}
		},
	);
});

// Login to Discord with your client's token
client.login(token);