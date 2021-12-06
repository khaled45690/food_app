const express = require('express');
const router = express.Router();
const{insertAddresses,getAddresses} = require('../logic/addressesLogic');



router.post('/',insertAddresses);
router.get('/',getAddresses);

module.exports = router;
