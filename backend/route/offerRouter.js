const express = require('express');
const router = express.Router();
const{insertOffers,getOffers} = require('../logic/offerLogic');



router.post('/',insertOffers);
router.get('/',getOffers);

module.exports = router;
