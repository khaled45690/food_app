const express = require('express');
const router = express.Router();
const{getImageResponse , saveImageResponse} = require('../logic/getImageLogic');



router.get('/',getImageResponse);
router.post('/', saveImageResponse);

module.exports = router;