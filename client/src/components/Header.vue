<template>
  <div class="">
    <nav class="navbar navbar-light bg-light">
      <span class="navbar-brand mb-0 h1">
        <span>Live2Learn</span>
        <br>
        <small>Disrupting Education System</small>
      </span>
      <span>
        <select v-model="role" v-on:change="$emit('role-changed', role)" class="custom-select">
          <option selected>Select your role</option>
          <option value="Seeker">Seeker</option>
          <option value="Sharer">Sharer</option>
        </select>
      </span>
    </nav>
  </div>
</template>

<script>
export default {
  name: 'Header',
  data: function() {
    return {
      role: ''
    };
  },
}
</script>