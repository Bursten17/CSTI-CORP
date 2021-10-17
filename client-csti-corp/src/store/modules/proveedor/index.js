import state from '@/store/modules/proveedor/state'
import mutations from '@/store/modules/proveedor/mutations'
import actions from '@/store/modules/proveedor/actions'

export default {
  namespaced: true,
  state: state,
  mutations: mutations,
  actions: actions,
  getters: {}
}
