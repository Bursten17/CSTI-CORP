const store = require('./store')

async function getProveedores() {
    try {
        return await store.getProveedores()
    } catch (error) {
        throw error;
    }
}

module.exports = {
    getProveedores,
}
