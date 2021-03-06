const express = require('express')
const routes = require('./routes/routes')
const app = express()
const mongoose = require('mongoose')
const bodyParser = require('body-parser')
// var cors = require('cors')


// connect to mongodb database
mongoose.Promise = global.Promise
mongoose.connect('mongodb://localhost/appdb', {
    useNewUrlParser: true,  
    useUnifiedTopology: true, 
    useUnifiedTopology: true 
})

// app.use(cors)
app.use(bodyParser.json())
routes(app)

// creating our middleware that catches mostly the errors
app.use((err, req, res, next) => {
    res.status(422).send({ error: err.message })
})

module.exports = app