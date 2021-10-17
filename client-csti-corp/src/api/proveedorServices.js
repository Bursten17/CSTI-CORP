import http from "@/api/http.js"

export const getProveedores = async () => {
    try {
        let response = await http.apiGet(`/proveedor`)
        return response
    } catch (error) {
        throw error
    }
}
