const mongoose = require('mongoose');
const CARTSHOP = require('../model/cartshopModel')
module.exports ={
       getCartshop:async (req,res,next)=>{
const cartshop = await CARTSHOP.find() ;
res.json({
    result: cartshop.map(res=>{
       return[{
        id:res.id,
       cartshop:res.cartshop
       }]
    })
})
    },
    insertCartshop:async(req,res)=>{
        const cartshop = await new CARTSHOP({
            cartshop: req.body.cartshop
        }).save()
        res.json({"message":"isnerted successfulllllyy",
  
        id:cartshop.id,
     cartshop:cartshop.cartshop


        });

    },
    deleteCartshop:async(req, res)=>{
        const id = req.params.id;
        const del = await CARTSHOP.findByIdAndRemove(id);
        res.json({"delete" : del});
    },
    updateCartshop: async (req, res) => {
        console.log(req.body);
        const cartshop = await CARTSHOP
        cartshop.findOneAndUpdate({ _id: mongoose.Types.ObjectId(req.body.id) }, req.body).then((result, error) => {
            cartshop.findOne({ _id: mongoose.Types.ObjectId(req.body.id) }, (error, result) => {
                console.log(result);
                res.json([{
                    id: result.id,
                    name: result.name,
                    price: result.price,
                    desc: result.desc,
                    quantity: result.quantity,
                    large: result.large,
                    xlarge:result.xlarge
                }]);
            });

        });
        // Character.findOneAndUpdate();
    }

}