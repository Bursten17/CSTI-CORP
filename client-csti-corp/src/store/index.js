import { createStore } from 'vuex'
import modules from '@/store/modules/index'

const store = createStore({
  modules:modules
})

export default store