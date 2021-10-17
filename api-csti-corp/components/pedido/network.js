const express = require('express')
const response = require('../../network/response')
const controller = require('./controller')

const router = express.Router()

router.get('/', function (req, res, next) {
    controller.getPedidos(req).then((data) => {
        response.success(req, res, "", 200, data)
    }).catch(next)
})

router.get('/:id', function (req, res, next) {
    controller.getPedidoPorId(req).then((data) => {
        response.success(req, res, "", 200, data)
    }).catch(next)
})

router.post('/', function (req, res, next) {
    controller.createPedido(req).then((data) => {
        response.success(req, res, "", 200, data)
    }).catch(next)
})

router.put('/:id', function (req, res, next) {
    controller.updatePedido(req).then((data) => {
        response.success(req, res, "", 200, data)
    }).catch(next)
})

router.delete('/:id', function (req, res, next) {
    controller.deletePedido(req).then((data) => {
        response.success(req, res, "", 200, data)
    }).catch(next)
})

module.exports = router