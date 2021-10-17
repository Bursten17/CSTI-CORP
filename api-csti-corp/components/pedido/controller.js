const store = require('./store')

async function getPedidos(req) {
    try {
        var obj = {
            estado: +req.query.estado
        }
        return await store.getPedidos(obj)
    } catch (error) {
        throw error;
    }
}

async function getPedidoPorId(req) {
    try {
        var obj = {
            idPedido: +req.params.id
        }
        return await store.getPedidoPorId(obj)
    } catch (error) {
        throw error;
    }
}

async function createPedido(req) {
    try {
        var obj = {
            idCliente: req.body.idCliente,
            nombreCliente: req.body.nombreCliente,
            observacion: req.body.observacion
        }
        return await store.createPedido(obj)
    } catch (error) {
        throw error;
    }
}

async function updatePedido(req) {
    try {
        var obj = {
            idPedido: +req.params.id,
            observacion: req.body.observacion,
            total: +req.body.total
        }
        return await store.updatePedido(obj)
    } catch (error) {
        throw error;
    }
}

async function deletePedido(req) {
    try {
        var obj = {
            idPedido: +req.params.id,
        }
        return await store.deletePedido(obj)
    } catch (error) {
        throw error;
    }
}

module.exports = {
    getPedidos,
    getPedidoPorId,
    createPedido,
    updatePedido,
    deletePedido
}
