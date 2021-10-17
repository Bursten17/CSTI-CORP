import http from "@/api/http.js"

export const getPedidos = async (
    estado,
) => {
    try {
        const searchParams = new URLSearchParams()

        searchParams.append('estado', estado)
        
        let response = await http.apiGet(`/pedido`, searchParams)
        return response
    } catch (error) {
        throw error
    }
}

export const getPedidoPorId = async (
    id,
) => {
    try {
        let response = await http.apiGet(`/pedido/${id}`)
        return response
    } catch (error) {
        throw error
    }
}

export const createPedido = async (
    data
) => {
    try {
        let response = await http.apiPost(`/pedido`,data)
        return response
    } catch (error) {
        throw error
    }
}

export const updatePedido = async (
    id,
    data
) => {
    try {
        let response = await http.apiPut(`/pedido/${id}`, data)
        return response
    } catch (error) {
        throw error
    }
}

export const deletePedido = async (
    id
) => {
    try {
        let response = await http.apiDelete(`/pedido/${id}`)
        return response
    } catch (error) {
        throw error
    }
}