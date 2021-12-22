const mongoose = require('mongoose');

const offers = mongoose.Schema({
    imagename: String,
    offername:String,
    offerprice:Number,
    description:String,
    
    
});

module.exports = mongoose.model("OFFERS",offers);


