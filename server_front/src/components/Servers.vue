<template>
  <div id="servers">
    <md-table>
        <md-table-row>
          <md-table-head md-numeric>ID</md-table-head>
          <md-table-head>Name</md-table-head>
          <md-table-head>Actions</md-table-head>
        </md-table-row>
        <md-table-row v-for="(server) in servers" :key="server.id">
          <md-table-cell md-numeric>{{ server['attributes']['id'] }}</md-table-cell>
          <md-table-cell>
            <a v-on:click="get_server_info(server)">{{ server['attributes']['name'] }}</a>
          </md-table-cell>
          <md-table-cell>
          <md-button v-on:click="delete_server(server.id)" class="md-raised md-accent">Delete</md-button>
          </md-table-cell>
        </md-table-row>
      </md-table>
      <br>
      <div v-if="selected.length > 0">
        <md-table>
          <md-table-row>
            <md-table-head md-numeric>ID</md-table-head>
            <md-table-head>Server Id</md-table-head>
            <md-table-head>Value</md-table-head>
            <md-table-head>Interface Name</md-table-head>
            <md-table-head>Value Id</md-table-head>
          </md-table-row>
          <md-table-row v-for="(select) in selected" :key="select.id">
            <md-table-cell md-numeric>{{ select['data']['id'] }}</md-table-cell>
            <md-table-cell >{{ select['data']['attributes']['server_id'] }}</md-table-cell>
            <md-table-cell >{{ select['data']['attributes']['value'] }}</md-table-cell>
            <md-table-cell >{{ select['data']['attributes']['interface_name'] }}</md-table-cell>
            <md-table-cell >{{ select['data']['attributes']['value_id'] }}</md-table-cell>
            
          </md-table-row>
        </md-table>
      </div>
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
    this.get_servers()
    },

    methods: {
      get_server_info: function (server) {
        console.log(server)
        this.selected = server['attributes']['bandwidths']

      },
      get_servers: function () {
        axios.get('http://localhost:3000/api/servers') 
            .then(response => {
                  this.servers = response.data['data']})
            .catch(e => {
                  console.log("ERR", e),
                  this.error.push(e)
            })
      },
      delete_server: function (id) {
        axios.delete('http://localhost:3000/api/servers/' + id)
        .then(response => {
              this.servers = response.data})
        .catch(e => {
               console.log("ERR", e),
               this.error.push(e)
        this.get_servers();
        })
      }
    }
  }
</script>>