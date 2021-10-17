const setPedidos = (state, payload) => {
  state.pedidos = payload
};

const setSending = (state, payload) => {
  state.sending = payload
};

const setPedido = (state, payload) => {
  state.pedido = payload
};

const setIdPedido = (state, payload) => {
  state.idPedido = payload
};

export default { 
  setPedidos,
  setSending,
  setPedido,
  setIdPedido
}


