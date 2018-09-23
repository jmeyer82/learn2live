<template>
  <div id="app">
   <div class="container">
      <Header v-on:role-changed="roleChanged"  />
      <div class="row app-body">
        <div class="col-md-6">
          Searching as a {{ currentRole }}
          <SearchInput 
            v-on:search-changed="searchChanged" 
            v-on:search-submitted="searchSubmited"
          />

          <label for="fields">Select a field to search</label>
          <select id="fields" v-model="searchField">
            <option value="education">Education</option>
            <option value="roles">Roles</option>
            <option value="description_roles">Description</option>
          </select>

          <Loader v-if="loadingResults" />
          <ResultList v-bind:results="results" v-bind:activeSearch="activeSearch" />
        </div>
        <div class="col-md-6 image-list">
          <img src="./assets/charts/1.png" class="" />
          <img src="./assets/charts/2.png" class="" />
          <img src="./assets/charts/3.png" class="" />
          <img src="./assets/charts/4.png" class="" />
          <img src="./assets/charts/5.png" class="" />
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
      activeSearch: false,
      currentRole: "",
      searchField: "",
    };
  },

  methods: {
    searchChanged: function(search) {
      this.search = search;
    },
    roleChanged: function(role) {
      this.currentRole = role;
    },
    searchSubmited: function(search) {
      const users = new Users;
      this.results = [];
      this.loadingResults = true;
      this.activeSearch = false;
      users.with(this.searchField, search).get(
        (response) => {
          let userData = JSON.parse(response);
          this.results = userData.filter(person => person.profile_type != this.currentRole);
          this.loadingResults = false;
          this.activeSearch = true;
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

.image-list img {
  max-width: 100%;
}

</style>
