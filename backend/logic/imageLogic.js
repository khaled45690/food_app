module.exports = {
    imageResponse:  (req, res, next) => {
        console.log(req.url); 
         console.log("req.url");

        res.end();
    },

}