import errorComponent from '@/pages/Error/components/error.vue'

const route = {
    path: '/:pathMatch(.*)*',
    component: errorComponent
}

export default route