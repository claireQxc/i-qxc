<script setup lang="ts">
import { HOME_PAGE_CARD } from '~/consts/index'
const router = useRouter()
const go = (path: string) => {
  if (path)
    router.push(`/${path}`)
}
</script>

<template>
  <Header />
  <div
    p10
    h-50
    flex="~ gap10"
    justify-center
    font-mono
    text-2xl
    flex-wrap
  >
    <card-button
      v-for="card, index in HOME_PAGE_CARD"
      :key="index"
      :card="card"
      w-80
      @card-clicked="go(card.url)"
    />
  </div>
  <div p10 font-mono>
    Much More fun is Building...
  </div>
</template>
