const express = require('express');
const router = express.Router();
const regController = require('../controllers/authFood');

router.post('/add_food', regController.addFood);
router.get('/updateform/:food_name', regController.updateForm);
router.get('/delete/:food_name', regController.deleteItem);
router.post('/update_food', regController.updateFood);

module.exports = router;