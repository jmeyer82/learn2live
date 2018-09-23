<template>
  <div class="hello">
    <input 
      name="search" 
      id="search" 
      v-model="search"
      v-on:keyup="$emit('search-changed', search)"
    />
  </div>
</template>

<script>
export default {
  name: 'SearchInput',
  data: function() {
    return {
      search: ''
    };
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

#search {
  width: 50%;
  font-size: 1.5em;
  padding: 0.25rem;
}

</style>
