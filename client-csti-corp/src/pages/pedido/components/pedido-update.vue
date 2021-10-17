<template>
<div>
    <Toolbar>
        <template #left>
            <h4>ACTUALIZAR PEDIDO  : {{$route.params.id}}</h4>
        </template>
    </Toolbar>
    <ProgressBar v-if="sending" mode="indeterminate" style="height: 2px"/>
    <Card class="p-fluid">
        <template #content>
            <div class="p-grid">
                <div class="p-col-12 p-md-4 p-lg-4">
                    <div class="p-d-flex">
                        <div><strong> CLIENTE :</strong></div>
                        <div class="p-d-flex p-jc-center p-ai-center p-ml-2">{{pedido.nombreCliente}}</div>
                    </div>
                </div>
                <div class="p-col-12 p-md-4 p-lg-4">
                    <div class="p-d-flex">
                        <div><strong> FECHA PEDIDO :</strong></div>
                        <div class="p-d-flex p-jc-center p-ai-center p-ml-2">{{pedido.fechaPedido}}</div>
                    </div>
                </div>
                <div class="p-col-12 p-md-4 p-lg-4">
                    <div class="p-d-flex">
                        <div><strong> ESTADO :</strong></div>
                        <div class="p-d-flex p-jc-center p-ai-center p-ml-2">{{pedido.estado}}</div>
                    </div>
                </div>
            </div>
            <div class="p-field p-col-12 p-md-6 p-lg-12">
                <label for="name1">Observacion</label>
                <Textarea 
                        v-model="v$.form.observacion.$model" 
                        class="p-inputtext-sm" 
                        :class="getValidationClass('observacion')" 
                        id="name1" 
                        type="text" 
                        rows="2"/>
                <small v-if="v$.form.observacion.required.$invalid && v$.form.observacion.$dirty" class="p-error">Observacion es requerido</small>
            </div>
        </template>
        <template #footer>
            <div class="p-col-12 p-md-6 p-lg-2">
                <Button @click="save()" class="p-button-sm" label="GUARDAR CAMBIOS"/>
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
        total: 0.00
      },
    }
  },
  computed: {
    ...mapState('pedido', {
      pedido: (state) => state.pedido,
      sending: (state) => state.sending,
    })
  },
  created () {
    this.getPedidoPorIdServices({
      id: this.$route.params.id
    }).then(() => {
      this.form.observacion = this.pedido.observacion
    })
  },
  validations() {
    return {
      form: {
        observacion: { required }
      }
    }
  },
  methods: {
    ...mapActions('pedido', {
      getPedidoPorIdServices: 'getPedidoPorIdServices',
      updatePedidoServices: 'updatePedidoServices'
    }),
    save () {
      if (this.validate()) return
      this.updatePedidoServices({
        id: this.$route.params.id,
        data: {
          total: this.form.total,
          observacion: this.form.observacion
        }
      }).then(() => {
        this.$router.push({ path: '/'})
        this.$toast.add({severity:'success', summary: `El pedido N° ${this.$route.params.id} a sido actualizado correctamente`, life: 3000});
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
    }
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
