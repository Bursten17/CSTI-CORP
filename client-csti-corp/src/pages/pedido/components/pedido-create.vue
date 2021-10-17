<template>
<div>
    <Toolbar>
        <template #left>
            <h4>CREAR PEDIDO</h4>
        </template>
    </Toolbar>
    <ProgressBar v-if="sending || sendingGuardarPedido"  mode="indeterminate" style="height: 2px"/>
    <Card class="p-fluid">
        <template #content>
            <div class="p-field p-col-12 p-md-6 p-lg-3">
              <label for="name1"> Proveedor</label>
              <Dropdown 
                        v-model="v$.form.proveedor.$model" 
                        :options="proveedores" 
                        optionLabel="nombre" 
                        :class="getValidationClass('proveedor')"
                        placeholder="Seleccione un proveedor" 
                        :disabled="sending || sendingGuardarPedido"/>
              <small v-if="v$.form.proveedor.required.$invalid && v$.form.proveedor.$dirty" class="p-error">El proveedor es requerido.</small>
            </div>
            <div class="p-field p-col-12 p-md-6 p-lg-3">
                <label for="name1">Observacion</label>
                <Textarea 
                        v-model="v$.form.observacion.$model" 
                        class="p-inputtext-sm" 
                        :class="getValidationClass('observacion')" 
                        id="name1" 
                        type="text" 
                        rows="2"
                        :disabled="sending || sendingGuardarPedido"/>
                <small v-if="v$.form.observacion.required.$invalid && v$.form.observacion.$dirty" class="p-error">La observacion es requerida</small>
            </div>
        </template>
        <template #footer>
            <div class="p-col-12 p-md-6 p-lg-2">
                <Button @click="save()" class="p-button-sm" label="GUARDAR" :disabled="sending || sendingGuardarPedido"/>
            </div>
        </template>
    </Card>
</div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import useValidate from '@vuelidate/core'
import { required } from '@vuelidate/validators'
export default {
  data () {
    return {
      v$: useValidate(),
      form: {
        observacion: '',
        proveedor: null
      },
    }
  },
  computed: {
    ...mapState('proveedor', {
      proveedores: (state) => state.proveedores,
      sending: (state) => state.sending,
    }),
    ...mapState('pedido', {
      idPedido: (state) => state.idPedido,
      sendingGuardarPedido: (state) => state.sending,
    })
  },
  created () {
    this.getProveedoresServices()
  },
  validations() {
    return {
      form: {
        observacion: { required },
        proveedor: {required }
      }
    }
  },
  methods: {
    ...mapActions('proveedor', {
      getProveedoresServices: 'getProveedoresServices'
    }),
    ...mapActions('pedido', {
      createPedidoServices: 'createPedidoServices'
    }),
    save () {
      if (this.validate()) return
      var obj = {
        idCliente: this.form.proveedor.id,
        nombreCliente: this.form.proveedor.nombre,
        observacion: this.form.observacion
      }
      this.createPedidoServices({
        data: obj
      }).then((data) => {
        this.$router.push({ path: '/'})
        this.$toast.add({severity:'success', summary: 'Pedido Creado Satisfactoriamente', life: 3000});
      }).catch((error) => {
        this.$toast.add({severity:'error', summary: error.message, life: 3000});
      })
    },
    validate () {
      this.v$.$touch()
      if (!this.v$.$error) return false
      return true
    },
    getValidationClass (fieldName) {
      const field = this.v$.form[fieldName]
      if (field) {
        return {
          'p-invalid': field.$invalid && field.$dirty
        }
      }
    },
  }
}
</script>

<style>
.p-toolbar {
    background: #f8f9fa;
    border-top: 0px;
    border-right: 0px;
    border-left: 0px;
    border-bottom: 1px solid #dee2e6 !important;
    padding: 1rem;
    border-radius: 3px;
  }
</style>
