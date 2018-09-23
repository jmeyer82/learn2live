<template>
  <div id="app">
    <div class="">
      <h1>Live2Learn</h1>
      <h2>Disrupting Education System</h2>
    </div>
    <SearchInput v-on:search-changed="searchChanged" msg="Welcome to Your Vue.js App" />
    <p>{{ search }}</p>
    <ResultList v-bind:results="results" />
  </div>
</template>

<script>
import SearchInput from './components/SearchInput.vue'
import ResultList from './components/results/ResultList.vue'

export default {
  name: 'app',
  components: {
    SearchInput,
    ResultList
  },
  data: function() {
    return {
      search: '',
      results: [
        {
          id: 0,
          text: "hello",
         },
         {
           id: 1,
           text: "this is a result",
         }
      ],
      lastSearch: 0,
    };
  },
  mounted() {
    // Trigger the search queue handler

  },
  methods: {
    searchChanged: function(search) {
      this.search = search;
      
      // Parse search results

      // Make an ajax request to the API to get results

      // Throttle the AJAX
        // If you've made a search within the last x seconds, queue up a new search 
      
      // this.results = [
      //   {
      //     id: 0,
      //     text: "Some other",
      //    },
      //    {
      //      id: 1,
      //      text: "Cool result",
      //    }
      //   ];
    },
  }
}

</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

</style>
