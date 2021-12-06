module.exports = {
    imageResponse: async (req, res, next) => {
        console.log(req.url); 
        // var RD = fs.createReadStream(__dirname + '../images' + x +'.png');
        res.end();
    },

}