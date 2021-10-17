import axios from 'axios'
// import store from '../store/index'

const http = axios.create({ baseURL: 'http://localhost:4000' })

http.interceptors.response.use(undefined, (error) => {
  let obj = { message: '', type: '' }
  if (error.message === 'Network Error' && !error.response) {
    obj.message = 'Network error - make sure the API server is running'
    obj.type = 'error'
    throw obj
  }

  if (error.response.status === 500) {
    obj.message = error.response.data.message || 'Server error - check the terminal for more info!'
    obj.type = 'error'
    throw obj
  }

  if (error.response.status === 401 && error.response.headers['www-authenticate'].includes('Bearer error="invalid_token", error_description="The token expired')) {
    // router.push('/login')
    obj.message = 'Session Expirada, vuelva a loguearse'
    obj.type = 'error'
    throw obj
  }

  // FluentValidateErrors
  if (error.response.status === 400) {
    obj.message = 'Error inesperado, comuniquese con el departamento de sistemas indicando el codigo del error 777'
    obj.type = 'error'
    throw obj
  }

  if (error.response.status === 403) {
    obj.message = 'Error inesperado, comuniquese con el departamento de sistemas para la verificacion de sus accesos'
    obj.type = 'error'
    throw obj
  }

  throw error.response.data.errors
})

const responseBody = (response) => response.data

const request = {
  apiGet: (url, obj) => http.get(url, { params: obj }).then(responseBody),
  apiGetExcel: (url, obj) => http.post(url, obj, { responseType: 'blob' }).then(responseBody),
  apiPost: (url, obj) => http.post(url, obj).then(responseBody),
  apiPut: (url, obj) => http.put(url, obj).then(responseBody),
  apiDelete: (url, obj) => http.delete(url, { params: obj }).then(responseBody),
  apiPostForm: (url, obj) => {
    const formData = new FormData()
    for (var key in obj) {
      if (key !== 'archivo') {
        formData.set(key, obj[key])
      } else {
        formData.append('File', obj.archivo.file)
      }
    }
    return http.post(url, formData, {
      headers: { 'Content-Type': 'multipart/form-data' }
    }).then(responseBody)
  }
}

export default request
