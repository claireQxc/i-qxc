<script setup lang="ts">
import { HOME_PAGE_CARD } from '~/consts/index'
console.log('HOME_PAGE_CARD---->', HOME_PAGE_CARD)
const router = useRouter()
const go = (path) => {
  if (path)
    router.push(`/${path}`)
}
</script>

<template>
  <div
    flex="~" justify-between
    border-b="1 gray-600/30"
    hover:border-red-500
  >
    <div flex="~ gap2" font-mono text-xl hover:opacity-100 hover:text-red-500>
      <button icon-btn @click="toggleDark()">
        <div dark:i-carbon-moon i-carbon-sun />
      </button>
      i-qxc
    </div>
  </div>
  <div
    flex="~ gap5"
    justify-center
    align-items-center
    font-mono
    text-2xl
    flex-wrap
  >
    <card-button
      v-for="card, index in HOME_PAGE_CARD"
      :key="index"
      :card="card"
      @card-clicked="go(card.url)"
    />
  </div>
</template>
