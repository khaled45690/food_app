const express = require('express');
const router = express.Router();
const{insertContacts,getContacts,deletecontact} = require('../logic/contactsLogic');



router.post('/',insertContacts);
router.get('/',getContacts);
router.delete('/:id',deletecontact);


module.exports = router;
