const express = require('express');
const productRoute = require('./route/products');
const app = express();
const mongoose = require('mongoose');
var bodyParser = require('body-parser');
const cors = require('cors');
const ContactRouter = require('./route/contactsRouter');
const ImageRouter = require('./route/ImageRouter');



const port = 4000;
mongoose.connect('mongodb+srv://khwater:khwater@cluster0.bbitm.mongodb.net/khwaterDatabase?retryWrites=true&w=majority',

{
    useNewUrlParser: true, 

useUnifiedTopology: true 
}
);
const connection = mongoose.connection;
connection.on('connected',()=>{console.log("connect with cloud")});
connection.on('error',()=>{console.log("error with database")});

app.use([bodyParser.urlencoded({extended : true}),express.json(),express.urlencoded({extended : true})]);
app.use(cors());


app.use('/products',productRoute);

app.use('/contacts', ContactRouter);

app.use('/image', ImageRouter);
app.use('/image', (req , res)=>{
    console.log(req.url);
    console.log("req.url");
});


app.listen(port,()=>{
    console.log("it is working");
})

module.exports = app;