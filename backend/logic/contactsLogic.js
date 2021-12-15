const { mongo, Mongoose } = require('mongoose');
const CONTACTS = require('../model/contactsModel');
const mongoose = require('mongoose');

module.exports = {
    insertContacts: async (req, res) => {
        const contacts = await CONTACTS({
            firstname: req.body.firstname,
            lastname: req.body.lastname,
            email: req.body.lastname,
            phone: req.body.phone
        }).save();
        res.json({
            message: "insert successfully",
            id: contacts.id,
            firstname: contacts.firstname,
            lastname: contacts.lastname,
            email: contacts.email,
            phone: contacts.phone


        });
    },
    getContacts: async (req, res) => {
        const contacts = await CONTACTS.find();
        res.json({
            result: contacts.map(res => {
                return {
                    id: res.id,
                    firstname: res.firstname,
                    lastname: res.lastname,
                    phone: res.phone
                }
            })
        });
    },
    deletecontact:async(req, res)=>{
        const id = req.params.id;
        const del = await CONTACTS.findByIdAndRemove(id);
        res.json({"delete" : del});
    },
    updatecontact:async(req,res)=>{
        console.log(req.body);
        const contacts = await CONTACTS
        contacts.findOneAndUpdate({ id: req.body.id} , req.body);
        // Character.findOneAndUpdate();
    }
}