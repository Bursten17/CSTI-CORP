import { createRouter, createWebHashHistory } from 'vue-router'
import PedidoRoute from '@/pages/pedido/pedido-routing'
import ErrorRoute from '@/pages/Error/error-routing'

const allRoutes = []
const routes = allRoutes.concat(
  PedidoRoute,
  ErrorRoute
)

const router = createRouter({
  history: createWebHashHistory(),
  routes
});

export default router;