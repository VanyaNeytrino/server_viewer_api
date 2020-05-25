import Vue from 'vue'
import Router from 'vue-router'
import Servers from '../components/Servers.vue'
Vue.use(Router)
export default new Router ({
 routes: [
  {       
    path: '/servers',
    name: 'Servers',
    component: 'Servers'
   },
  ]
})