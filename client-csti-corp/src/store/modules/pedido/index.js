import state from '@/store/modules/pedido/state'
import mutations from '@/store/modules/pedido/mutations'
import actions from '@/store/modules/pedido/actions'

export default {
  namespaced: true,
  state: state,
  mutations: mutations,
  actions: actions,
  getters: {}
}
