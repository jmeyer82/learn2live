<template>
  <div class="result-list">
    <ul class="list-group">
      <li
        is="ResultItem"
        v-for="(result) in results"
        v-bind:key="result.id"
        v-bind:user="result"
      ></li>
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
    results: Array
  },
  data: function() {
    return {};
  },
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
