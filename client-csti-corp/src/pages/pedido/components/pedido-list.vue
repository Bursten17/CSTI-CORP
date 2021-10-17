<template>
<div>
  <Toolbar>
      <template #left>
        <h4>PEDIDOS</h4>
      </template>
  </Toolbar>
  <Toolbar>
      <template #left>
      </template>

      <template #right>
          <Button @click.prevent="$router.push({ path: '/create'})" label="CREAR" icon="pi pi-plus" class="p-mr-2 p-button-sm" />
      </template>
  </Toolbar>
  <DataTable 
            :value="pedidos" 
            class="p-datatable-customers p-datatable-sm" 
            :lazy="true"
            :loading="sending"
            style="margin-bottom: 20px" >
        <template #empty>
           No existe pedidos
        </template>
        <template #loading>
            Cargando pedidos por favor espere.
        </template>
        <Column field="codigo" header="CODIGO">
          <template  #body="slotProps">
              <div class="p-d-flex p-jc-center">
                {{slotProps.data.id}}
              </div>
          </template>
        </Column>
        <Column field="cliente" header="PROVEEDOR">
          <template #body="slotProps">
              <div class="p-d-flex p-jc-center">
                {{slotProps.data.idCliente}} - {{slotProps.data.nombreCliente}}
              </div>
            </template>
        </Column>
        <Column field="fecha pedido" header="FECHA">
            <template #body="slotProps">
              <div class="p-d-flex p-jc-center">
                {{$filters.dateFilter(slotProps.data.fechaPedido)}}
              </div>
            </template>
        </Column>
        <Column field="observacion" header="OBSERVACION">
            <template #body="slotProps">
                {{slotProps.data.observacion}}
            </template>
        </Column>
        <Column field="total" header="TOTAL">
            <template #body="slotProps">
              <div class="p-d-flex p-jc-center">
                {{$filters.solesFilter(slotProps.data.total)}}
              </div>
            </template>
        </Column>
        <Column>
            <template #body="slotProps">
                <Button 
                    @click.prevent="$router.push({ path: `/update/${slotProps.data.id}`})" 
                    icon="pi pi-pencil" 
                    type="button" 
                    class="p-button-success p-mr-2 p-mb-1 p-button-sm"></Button>
                <Button 
                    @click.prevent="eliminarPedido(slotProps.data.id)" 
                    icon="pi pi-trash" 
                    type="button" 
                    class="p-button-danger p-mr-2 p-mb-1 p-button-sm"></Button>
            </template>
        </Column>
    </DataTable>
</div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
export default {
  data () {
    return {
      clientFilterRequest: {
        search: '',
        n_state: null
      }
    }
  },
  computed: {
    ...mapState('pedido', {
      pedidos: (state) => state.pedidos,
      sending: (state) => state.sending,
    })
  },
  created () {
    this.getPedidosServices({
      estado: 1
    })
  },
  methods: {
    ...mapActions('pedido', {
      getPedidosServices: 'getPedidosServices',
      deletePedidoServices: 'deletePedidoServices'
    }),
    eliminarPedido(id) {
      this.deletePedidoServices({
        id: id
      }).then(() => {
        this.$toast.add({severity:'success', summary: `El pedido N° ${id} a sido eliminado correctamente`, life: 3000});
        this.getPedidosServices({
          estado: 1
        })
      }).catch((error) => {
        this.$toast.add({severity:'error', summary: error.message, life: 3000});
      })
    }
  }
}
</script>

<style lang="scss" scoped>
	@media screen and (max-width: 960px) {
		::v-deep(.p-datatable) {
			&.p-datatable-customers {
				.p-datatable-thead > tr > th,
				.p-datatable-tfoot > tr > td {
					display: none !important;
				}

				.p-datatable-tbody > tr {
					border-bottom: 1px solid #dee2e6;
					> td {
						text-align: left !important;
						display: flex;
						align-items: center;
						justify-content: center;
						border: 0 none !important;
						width: 100% !important;
						float: left;
						clear: left;
						border: 0 none;

						.p-column-title {
							padding: .4rem;
							min-width: 30%;
							display: inline-block;
							margin: -.4rem 1rem -.4rem -.4rem;
							font-weight: bold;
							flex: 1;
						}

						.p-progressbar {
							margin-top: .5rem;
						}
					}
				}
			}
		}
	}	.p-divider.p-divider-horizontal {
		margin: 0px !important;
		padding: 0px !important;
	}


	::v-deep(.p-datatable) {
		.p-column-title{
			font-weight: bold;
		}
	}

	.p-datatable .p-datatable-thead > tr > th {
		text-align: center	!important;
		padding: 1rem 1rem;
		border: 1px solid #e9ecef;
		border-width: 0 0 1px 0;
		font-weight: 600;
		color: #495057;
		background: #f8f9fa;
		-webkit-transition: -webkit-box-shadow 0.2s;
		transition: -webkit-box-shadow 0.2s;
		transition: box-shadow 0.2s;
		transition: box-shadow 0.2s, -webkit-box-shadow 0.2s;
	}

	::v-deep(.p-datatable.p-datatable-customers) {
		.p-datatable-thead > tr > th {
			text-align: center;
		}
	}

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
