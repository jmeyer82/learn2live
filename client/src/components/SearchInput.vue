<template>
    <form v-on:submit.prevent="$emit('search-submitted', search)">
      <div class="input-group">
        <input 
          name="search" 
          id="search" 
          v-model="search"
          v-on:keyup="$emit('search-changed', search)"
        />
        <div class="input-group-append">
          <button type="submit" class="btn btn-outline-secondary" id="button-addon2">Search</button>
        </div>
          </div>
    </form>
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
  width: 86%;
  border-radius: 3px 0px 0px 3px;
  border: 1px solid #6c757d;
}




</style>
