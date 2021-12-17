const express = require('express');
const path = require('path');
const dotenv = require('dotenv');
// const hbs = require('express-handlebars');
const port = process.env.PORT || 3000;

dotenv.config({path: './.env'});

const app = express();

// * Set hbs (Handlebars) as viewer template engine
app.set('view engine', 'hbs');

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use('/auth', require('./routes/auth'));
app.use('/', require('./routes/foodRoutes'));

app.listen(port, () => {
    console.log(`Server started at Port ${port}`);

    // * Checking if DB is connected
    // db.connect((err) => {
    //     err ? console.log('Error:', err) : console.log('DB Connected.');
    // })
})