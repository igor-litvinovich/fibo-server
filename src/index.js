require('dotenv').config();
const express = require('express');
const config = require('config');
const { fibo } = require('./fibo');

//const {History} = require('./db');

const app = express();

app.get('/fibo', async(req, res) => {
    const { after } = req.query;
    if (!after || after > 15) {
        res.status(500).json({
            message: "after parameter should be less than 15"
        })
    }
    const number = fibo(Number.parseInt(after));
    res.json({ number, version: '2.1.2' });
});

const port = config.get('server.port');
app.listen(config.get('server.port'), () => {
    console.log(`Application is up and running on port ${port}`);
});

//loadtest -c 1 -n 40 --rps 2 http://localhost:8080/fibo?after=39