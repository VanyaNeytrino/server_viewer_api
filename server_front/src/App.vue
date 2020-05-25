<template>
  <div id="app">
    <Servers></Servers>
  </div>
</template>

<script>
import Vue from 'vue'
import Servers from './components/Servers.vue'
import { MdTable, MdButton } from 'vue-material/dist/components'
import 'vue-material/dist/vue-material.min.css'
import 'vue-material/dist/theme/default.css'

Vue.use(MdTable)
Vue.use(MdButton)

export default {
  name: 'App',
  components: {
     Servers
  }
}
</script>

<style>
/* #app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
} */
</style>
