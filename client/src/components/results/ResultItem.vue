<template>
  <li href="#" class="list-group-item list-group-item-action flex-column align-items-start">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">{{ user.name }}</h5>
    </div>
    <p class="mb-1">{{ user.roles | listify }}</p>
    <small >{{ user.description_roles | listify }}</small>
    <br>
    <small>{{ user.education | listify }}</small>
  </li>
</template>

<script>
export default {
  name: 'ResultItem',
  props: {
    user: Object,
  },
  filters: {
    listify: function (value) {
      if (!value) return '';
      value = value.replace(/,/g, ", ");
      return value;
    }
  }

}
</script>

<style scoped>

li {
  text-align: left;
}

</style>
