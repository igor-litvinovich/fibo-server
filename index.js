const express = require('express');

const { fibo } = require('./fibo');

const app = express();

app.get('/fibo', async (req, res) => {
    const { after } = req.query;
    const hrstart = process.hrtime();

    const number = fibo(Number.parseInt(after));
    const hrend = process.hrtime(hrstart);
    console.info('Execution time : %ds %dms', hrend[0], hrend[1] / 1000000);

    res.json({ number });
});

app.listen(8080, () => {
    console.log('Application is up and running on port 8080');
});

//loadtest -c 1 -n 16 --rps 4 http://localhost:8080/fibo?after=39