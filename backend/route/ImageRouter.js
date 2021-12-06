const express = require('express');
const router = express.Router();
const{imageResponse} = require('../logic/imageLogic');



// router.get('/image',imageResponse);
router.use('/image',(req , res)=>{
console.log(req.url);
console.log("req.url");
});

module.exports = router;