const express = require('express');
const router = express.Router();
const{inserContacts,getContacts} = require('../logic/contactsLogic');



router.post('/',inserContacts);
router.get('/',getContacts);

module.exports = router;
