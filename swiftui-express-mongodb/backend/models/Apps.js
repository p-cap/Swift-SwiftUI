const mongoose = require('mongoose')
const Schema = mongoose.Schema

const AppsSchema = new Schema ({
    
    AppName: {
        type: String,
        required: true
    },
    FileName: {
        type: String,
        required: true
    },
    Sha1: {
        type: String,
        required: true
    }
})

//don't forget to declare the model
// is info the name of the collection??????
const Apps = mongoose.model('app', AppsSchema)

module.exports = Apps



// I deleted the database
// express will not automatically create the db like most frameworks
// According to tutorialpoints, if I used the use <mydb> command, it will still not create a db
// https://www.tutorialspoint.com/mongodb/mongodb_create_database.htm
// I need to insert a document.....let's see
// I will insert the document based on the InfoSchema above

// > db.info.insertOne({
//     ... "name":"pcap",
//     ... "name":"cyber"
//     ... })
//     {
// info is the collection


// I was having trouble with the command above.
// But, my collection needed to be PLURAL!!!!
// reference: https://mongoosejs.com/docs/models.html

// starting with the schema
// I ran mongo localhost:27017/infodb data.js
// the data.js file is contained within the 
// tools folder

