const express = require('express')
const response = require('../../network/response')
const controller = require('./controller')

const router = express.Router()

router.get('/', function (req, res, next) {
    controller.getProveedores().then((data) => {
        response.success(req, res, "", 200, data)
    }).catch(next)
})


module.exports = router