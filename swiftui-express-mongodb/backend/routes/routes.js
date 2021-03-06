const AppsController = require('../controllers/AppsController')
// const Info = require('../models/apps')

module.exports = (app) => {
    app.get('/', AppsController.greeting)

    app.get('/apps', AppsController.read)

    app.post('/add', AppsController.create)

    app.put('/update/:appName', AppsController.edit)

    app.delete('/delete/:appName', AppsController.delete)

}