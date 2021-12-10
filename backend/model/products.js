const mongoose = require('mongoose');
const products = mongoose.Schema({
    name:{type:String,required:true},
    price:Number,
    desc:String,
    quantity:Number,
    large:Boolean,
    xlarge:Boolean
})

module.exports = mongoose.model('PRODUCTS',products);