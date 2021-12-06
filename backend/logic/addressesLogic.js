const ADDRESSES = require('../model/addressesModel');


module.exports = {
    insertAddresses: async (req, res) => {
        const addresses = await ADDRESSES({
            streetname: req.body.streetname,
            town: req.body.town,
            postcode: req.body.postcode,
            
        }).save();
        res.json({
            message: "insert successfully",
            id: addresses.id,
            streetname: addresses.streetname,
            town: addresses.town,
            


        });
    },
    getAddresses: async (req, res) => {
        const addresses = await ADDRESSES.find();
        res.json({
            result: addresses.map(res => {
                return {
                    id: res.id,
                    streetname: res.streetname,
                    town: res.town,
                }
            })
        });
    }
}