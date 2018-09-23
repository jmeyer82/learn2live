<template>
  <div id="app">
   <div class="container">
      <Header />
      <div class="row app-body">
        <div class="col-md-6">
          <SearchInput 
            v-on:search-changed="searchChanged" 
            v-on:search-submitted="searchSubmited"
          />
          <Loader v-if="loadingResults" />
          <ResultList v-bind:results="results" />
        </div>
        <div class="col-md-6">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Header from './components/Header.vue'
import Loader from './components/Loader.vue'
import SearchInput from './components/SearchInput.vue'
import ResultList from './components/results/ResultList.vue'
import Users from './libraries/api.js'

export default {
  name: 'app',
  components: {
    Header,
    Loader,
    SearchInput,
    ResultList
  },
  
  data: function() {
    return {
      search: '',
      results: [],
      loadingResults: false,
    };
  },

  methods: {
    searchChanged: function(search) {
      this.search = search;
    },
    searchSubmited: function(search) {
      const users = new Users;
      this.loadingResults = true;
      users.with("education", search).get(
        (response) => {
          this.results = JSON.parse(response);
          this.loadingResults = false;
        }
      );
    },
  }

}

</script>

<style>

#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin-top: 60px;
}

.app-body {
  margin-top: 2em;
}

</style>
