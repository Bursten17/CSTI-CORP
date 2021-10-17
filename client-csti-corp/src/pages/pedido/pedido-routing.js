import PedidoIndex from '@/pages/pedido/components/pedido-index.vue'
import PedidoList from '@/pages/pedido/components/pedido-list.vue'
import PedidoCreate from '@/pages/pedido/components/pedido-create.vue'
import PedidoUpdate from '@/pages/pedido/components/pedido-update.vue'

const route = {
  path: '/',
  component: PedidoIndex,
  children: [
    {
      path: '',
      component: PedidoList
    },
    {
      path: 'create',
      component: PedidoCreate
    },
    {
      path: 'update/:id',
      component: PedidoUpdate
    }
  ]
}

export default route