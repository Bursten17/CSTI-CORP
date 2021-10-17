const { sql, connection } = require('../../db/sql')
const newError = require('../../utils/error');

async function getPedidos(data) {
    var connectionDb = await connection()

    try {
        const request = await connectionDb.request()

        request.input("P_estado", sql.Int, data.estado);

        var response = await request.execute("[dbo].[USP_GET_PEDIDOS]")

        return response.recordset
    } catch (error) {
        throw newError(error.message || 'Vuelva a intentarlo', error.status);
    } finally {
        connectionDb.close();
    }
}

async function getPedidoPorId(data) {
    var connectionDb = await connection()

    try {
        const request = await connectionDb.request()

        request.input("P_id", sql.Int, data.idPedido);

        var response = await request.execute("[dbo].[USP_GET_PEDIDO_POR_ID]")

        return response.recordset[0]
    } catch (error) {
        throw newError(error.message || 'Vuelva a intentarlo', error.status);
    } finally {
        connectionDb.close();
    }
}

async function createPedido(data) {
    try {
        var connectionDb = await connection()
        const transaction = await connectionDb.transaction();
        const transactionBegin = await transaction.begin();
        var request = await transactionBegin.request();
        
        try {
            request.input("P_idCliente", sql.Int, data.idCliente);
            request.input("P_nombreCliente", sql.VarChar(100), data.nombreCliente);
            request.input("P_observacion", sql.VarChar(100), data.observacion);
            request.input("P_total", sql.Decimal(10, 2), 0.00);
    
            var response = await request.execute("[dbo].[USP_CREATE_PEDIDO]")

            await transactionBegin.commit();

            if(response.rowsAffected[0] > 0)
                return response.rowsAffected[0] > 0
            else
                throw newError(error.message || 'Vuelva a intentarlo', error.status);
        } catch (error) {
            await transactionBegin.rollback();
            throw newError(error.message || 'Vuelva a intentarlo', error.status);
        } 
    } catch (error) {
        throw newError(error.message || 'Vuelva a intentarlo', error.status);
    } finally {
        connectionDb.close();
    }
}

async function updatePedido(data) {
    try {
        var connectionDb = await connection()
        const transaction = await connectionDb.transaction();
        const transactionBegin = await transaction.begin();
        var request = await transactionBegin.request();
        
        try {
            request.input("P_id", sql.Int, data.idPedido);
            request.input("P_observacion", sql.VarChar(500), data.observacion);
            request.input("P_total", sql.Decimal(10, 2), data.total);
    
            var response = await request.execute("[dbo].[USP_UPDATE_PEDIDO]")

            await transactionBegin.commit();

            if(response.rowsAffected[0] > 0)
                return response.rowsAffected[0] > 0
            else
                throw newError(error.message || 'Vuelva a intentarlo', error.status);
        } catch (error) {
            await transactionBegin.rollback();
            throw newError(error.message || 'Vuelva a intentarlo', error.status);
        } 
    } catch (error) {
        throw newError(error.message || 'Vuelva a intentarlo', error.status);
    } finally {
        connectionDb.close();
    }
}

async function deletePedido(data) {
    try {
        var connectionDb = await connection()
        const transaction = await connectionDb.transaction();
        const transactionBegin = await transaction.begin();
        var request = await transactionBegin.request();
        
        try {
            request.input("P_id", sql.Int, data.idPedido);
    
            var response = await request.execute("[dbo].[USP_DELETE_PEDIDO]")

            await transactionBegin.commit();

            if(response.rowsAffected[0] > 0)
                return response.rowsAffected[0] > 0
            else
                throw newError(error.message || 'Vuelva a intentarlo', error.status);
        } catch (error) {
            await transactionBegin.rollback();
            throw newError(error.message || 'Vuelva a intentarlo', error.status);
        } 
    } catch (error) {
        throw newError(error.message || 'Vuelva a intentarlo', error.status);
    } finally {
        connectionDb.close();
    }
}

module.exports = {
    getPedidos,
    getPedidoPorId,
    createPedido,
    updatePedido,
    deletePedido
}