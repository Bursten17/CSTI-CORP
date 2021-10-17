const setProvedores = (state, payload) => {
  state.proveedores = payload
};

const setSending = (state, payload) => {
  state.sending = payload
};

export default { 
  setProvedores,
  setSending,
}


