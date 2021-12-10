
const PRODUCTS = require('../model/products')
module.exports ={
       getProducts:async (req,res,next)=>{
const products = await PRODUCTS.find() ;
res.json({
    result: products.map(res=>{
       return{
        id:res.id,
        price:res.price,
        name:res.name,
        desc:res.desc,
        quantity:res.quantity,
        large:res.large,
        xlarge:res.xlarge
       }
    })
})
    },
    insertProduct:async(req,res)=>{
        const product = await new PRODUCTS({
            name: req.body.name,
            price: req.body.price,
            desc: req.body.desc
        }).save()
        res.json({"message":"isnerted successfully",
        id: product.id,
        name:product.name
        })

    },
    deleteProducts:async(req, res)=>{
        const id = req.params.id;
        const del = await PRODUCTS.findByIdAndRemove(id);
        res.json({"delete" : del});
    }

}