const express = require('express');
const router = express.Router();
const{insertAddresses,getAddresses,deleteAddresse} = require('../logic/addressesLogic');



router.post('/',insertAddresses);
router.get('/',getAddresses);
router.delete('/:id',deleteAddresse);


module.exports = router;
