// const user = require('../components/user/network')
const pedido = require('../components/pedido/network')
const proveedor = require('../components/proveedor/network')
const errors = require('../network/errors')

const routes = function (server) {
    // server.use('/user', user)
    server.use('/pedido', pedido)
    server.use('/proveedor', proveedor)
    server.use(errors)
}

module.exports = routes
