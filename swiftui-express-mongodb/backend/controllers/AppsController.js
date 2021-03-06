const Apps = require('../models/Apps')

module.exports = {
    greeting(req, res) {
        res.send("Welcome to Pcap's World")
    },

    read(req, res, next) {
        Apps.find()
        .then(Apps => res.send(Apps))
        .catch(next)
    },

    create(req, res, next) {
        const AppsProps = req.body

        Apps.create(AppsProps)
        .then(Apps => res.send(Apps))
        .catch(next)
     },

     edit(req, res, next) {
         const AppsName = req.params.appName
         const AppsProps = { 
             FileName: req.body.FileName,
             Sha1: req.body.Sha1
         }

         Apps.updateMany({ AppName: AppsName }, 
            { FileName: AppsProps.FileName, Sha1: AppsProps.Sha1 })
         .then( Apps => res.send(Apps))
         .catch(next)
        },

     delete(req, res, next) {
        const AppsName = req.params.appName

        Apps.deleteMany( { AppName : AppsName } ) 
        .then(Apps => res.status(204).send(`${Apps.appName} was successfull deleted`))
     }     
}