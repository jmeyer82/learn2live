<template>
  <div class="result-list">
    <ul class="list-group">
      <li
        is="ResultItem"
        v-for="(result) in results"
        v-bind:key="result.id"
        v-bind:user="result"
      ></li>
      <div v-if="hasResults">
        <h3>No results</h3>
      </div>
    </ul>
  </div>
</template>

<script>
import ResultItem from './ResultItem.vue'

export default {
  name: 'ResultList',
  components: {
    ResultItem
  },
  props: {
    results: Array,
    activeSearch: Boolean
  },
  computed: {
    // a computed getter
    hasResults: function () {
      // `this` points to the vm instance
      return ! this.results.length > 0 && this.activeSearch;
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.result-list {
  margin-top: 2em;
}

ul {
  padding: 0;
}
li {
  display: block;
}
</style>
