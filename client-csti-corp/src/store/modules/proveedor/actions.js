import { getProveedores } from '@/api/proveedorServices.js'

const getProveedoresServices = async ({state, commit}, payload) => {
    try {
        commit('setSending', true)

        let response = await getProveedores()
        commit('setProvedores', response.data)
    } catch (error) {
        commit('setSending', false)
    } finally {
        commit('setSending', false)
    }
}

export default {
    getProveedoresServices
}