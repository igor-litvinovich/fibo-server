require('dotenv').config();
const express = require('express');
const config = require('config');
const { fibo } = require('./fibo');

//const {History} = require('./db');

const app = express();

app.get('/fibo', async (req, res) => {
    const { after } = req.query;
    const hrstart = process.hrtime();

    const number = fibo(Number.parseInt(after));
    const hrend = process.hrtime(hrstart);
   // console.info('Execution time : %ds %dms', hrend[0], hrend[1] / 1000000);
    /*await History.create({
        result: number,
        createdDate: new Date()
    });*/
    res.json({ number, version: '1.1.20' });
});

const port = config.get('server.port');
app.listen(config.get('server.port'), () => {
    console.log(`Application is up and running on port ${port}`);
});

//loadtest -c 1 -n 40 --rps 2 http://localhost:8080/fibo?after=39
