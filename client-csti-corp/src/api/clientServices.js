import http from "@/api/http.js"

export const GetAllClient = async (
  Status,
  PaginationRequest,
  FilterRequest
  ) => {
    try {
    var obj = {
      status: Status,
      paginationRequest: {
        currentPage: PaginationRequest.currentPage,
        pageSize:PaginationRequest.pageSize
      },
      filterRequest: {
        search: FilterRequest.search,
        n_state: FilterRequest.n_state
      }
    }

    const searchParams = new URLSearchParams()

    searchParams.append('status', obj.status)
    if(obj.paginationRequest.currentPage !== null) searchParams.append('CurrentPage', obj.paginationRequest.currentPage)
    searchParams.append('PageSize', obj.paginationRequest.pageSize)
    if (obj.filterRequest.n_state != null) searchParams.append('n_state', obj.filterRequest.n_state)
    if (obj.filterRequest.search) {
      searchParams.append('search', obj.filterRequest.search)
    }
    let response = await http.apiGet(`/client`, searchParams)
    return response
  } catch (error) {
    throw error
  }
}

export const GetClientById = async n_id_client => {
  try {
    let response = await http.apiGet(`/client/${n_id_client}`)
    return response
  } catch (error) {
    throw error
  }
}

export const Create = async obj => {
  try {
    let response = await http.apiPost(`/client`, obj)
    return response
  } catch (error) {
    throw error
  }
}

export const Update = async (n_id_client, obj) => {
  try {
    let response = await http.apiPut(`/client/${n_id_client}`, obj)
    return response
  } catch (error) {
    throw error
  }
}

export const UpdateState = async (n_id_client, obj) => {
  try {
    let response = await http.apiPut(`/client/${n_id_client}`, obj)
    return response
  } catch (error) {
    throw error
  }
}
