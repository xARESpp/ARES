<script setup>
  import { isExternalLink } from '@/utils/validate'
  import { RouterLink, useLink } from 'vue-router'
  const props = defineProps({
    ...RouterLink.props,
    inactiveClass: String,
    disabled: {
      type: Boolean,
      default: false
    },
  })

  const { navigate, href, route, isActive, isExactActive } = useLink(props)
  
  const isExternal = computed(() => {
    return isExternalLink(props.to)
  })
</script>

<template>
  <a v-if="isExternal" v-bind="$attrs" :href="disabled ? 'javascript:void(0)' : to" target="_blank">
    <slot />
  </a>
  <router-link v-else v-bind="$props" custom v-slot="{ isActive, href, navigate }" :to="disabled ? '' : to">
    <a v-bind="$attrs" :href="disabled ? 'javascript:void(0)' : href" @click="navigate" :class="isActive ? activeClass : inactiveClass">
      <slot />
    </a>
  </router-link>
</template>

<style lang="scss" scoped>
</style>