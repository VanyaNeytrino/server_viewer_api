<template>
 <div id="servers">
   <md-table>
      <md-table-row>
        <md-table-head md-numeric>ID</md-table-head>
        <md-table-head>Name</md-table-head>
      </md-table-row>
      <md-table-row v-for="(server) in servers" :key="server.id">
        <md-table-cell md-numeric>{{ server['attributes']['id'] }}</md-table-cell>
        <md-table-cell>
          <a v-on:click="get_server_info(server)">{{ server['attributes']['name'] }}</a>
        </md-table-cell>
      </md-table-row>
    </md-table>
    
    <div v-if="selected.length > 0">
      <md-table>
        <md-table-row>
          <md-table-head md-numeric>ID</md-table-head>
          <md-table-head>Server Id</md-table-head>
          <md-table-head>Value</md-table-head>
          <md-table-head>Inteface Name</md-table-head>
          <md-table-head>Value Id</md-table-head>
        </md-table-row>
        <md-table-row v-for="(select) in selected" :key="select.id">
          <md-table-cell md-numeric>{{ select['data']['id'] }}</md-table-cell>
          <md-table-cell >{{ select['data']['attributes']['server_id'] }}</md-table-cell>
          <md-table-cell >{{ select['data']['attributes']['value'] }}</md-table-cell>
          <md-table-cell >{{ select['data']['attributes']['inteface_name'] }}</md-table-cell>
          <md-table-cell >{{ select['data']['attributes']['value_id'] }}</md-table-cell>
          
        </md-table-row>
      </md-table>
    </div>
  <!-- <div v-for="(server) in servers" :key="server.id">
   <p>{{server['attributes']['name']}} is my {{server.relationship}}</p>
  </div> -->
 </div>
</template>

<script>
  import axios from 'axios'
  export default {
    name: 'TableBasic',
  data() {
    return {
    servers: [],
    name: [],
    relationship: [],
    errors: [],
    selected: []
    }
  },
  created() {
    // response = axios.get('http://localhost:3000/api/servers').then(response => response.data)
    // console.log(response.data)
    axios.get('http://localhost:3000/api/servers') 
    .then(response => {
    this.servers = response.data['data']})
    .catch(e => {
      console.log("ERR", e),
      this.error.push(e)
      })
    },

    methods: {
      get_server_info: function (server) {
        console.log(server)
        this.selected = server['attributes']['bandwidths']

      }
    }
  }
</script>>