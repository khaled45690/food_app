const mongoose = require('mongoose');
const cartshop = mongoose.Schema([{
  
    cartlist:Array
}])

module.exports = mongoose.model('CARTSHOP',cartshop);