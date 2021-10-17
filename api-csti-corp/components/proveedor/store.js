const { sql, connection } = require('../../db/sql')
const newError = require('../../utils/error');

async function getProveedores() {
    var connectionDb = await connection()

    try {
        const request = await connectionDb.request()

        var response = await request.execute("[dbo].[USP_GET_PROVEEDORES]")

        return response.recordset
    } catch (error) {
        throw newError(error.message || 'Vuelva a intentarlo', error.status);
    } finally {
        connectionDb.close();
    }
}

module.exports = {
    getProveedores,
}