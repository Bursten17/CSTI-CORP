import { getPedidos, getPedidoPorId, createPedido, updatePedido, deletePedido } from '@/api/pedidoServices.js'

const getPedidosServices = async ({ state, commit }, payload) => {
    try {
        commit('setSending', true)

        let response = await getPedidos(payload.estado)
        commit('setPedidos', response.data)
    } catch (error) {
        commit('setSending', false)
    } finally {
        commit('setSending', false)
    }
}

const getPedidoPorIdServices = async ({ state, commit }, payload) => {
    try {
        commit('setSending', true)

        let response = await getPedidoPorId(payload.id)
        console.log('response', response)
        commit('setPedido', response.data)
    } catch (error) {
        commit('setSending', false)
    } finally {
        commit('setSending', false)
    }
}

const createPedidoServices = async ({ state, commit }, payload) => {
    try {
        commit('setSending', true)
        let response = await createPedido(payload.data)
        commit('setIdPedido', response.data)
    } catch (error) {
        console.log('error action', error)
        commit('setSending', false)
        throw error
    } finally {
        commit('setSending', false)
    }
}

const updatePedidoServices = async ({ state, commit }, payload) => {
    try {
        commit('setSending', true)
        await updatePedido(payload.id, payload.data)
    } catch (error) {
        console.log('error action', error)
        commit('setSending', false)
        throw error
    } finally {
        commit('setSending', false)
    }
}

const deletePedidoServices = async ({ state, commit }, payload) => {
    try {
        commit('setSending', true)
        await deletePedido(payload.id)
    } catch (error) {
        commit('setSending', false)
        throw error
    } finally {
        commit('setSending', false)
    }
}

export default {
    getPedidosServices,
    getPedidoPorIdServices,
    createPedidoServices,
    updatePedidoServices,
    deletePedidoServices
}