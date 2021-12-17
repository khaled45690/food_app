const mongoose = require('mongoose');
const products = mongoose.Schema({
    name:String,
    price:Number,
    pricemax:Number,
    desc:String,
    quantity:Number,
    large:Boolean,
    xlarge:Boolean
})

module.exports = mongoose.model('PRODUCTS',products);