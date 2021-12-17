const express = require('express');
const router = express.Router();
const regController = require('../controllers/authFood');

router.get('/', regController.readFood);

router.get('/add_new_food', (request, response) => {
    response.render('addFood');
});

module.exports = router;