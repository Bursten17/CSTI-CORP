const express = require('express')
const response = require('../../network/response')
const controller = require('./controller')
const router = express.Router()

router.post('/', function (req, res) {
    response.success(req, res, "Hola fernando")
})


module.exports = router