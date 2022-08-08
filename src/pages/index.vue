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
    mb-10
  >
    <card-button
      v-for="card, index in HOME_PAGE_CARD"
      :key="index"
      :card="card"
      w-80
      @card-clicked="go(card.url)"
    />
  </div>
  <div p10 font-mono class="a-inspector-loader hover:color-red-600">
    Much More fun is Building
    <span class="dots"><span>.</span><span>.</span><span>.</span></span>
  </div>
</template>

<style scoped>
@keyframes dots-1 {
  from {
    opacity: 0
  }
  25% {
    opacity: 1
  }
}
@keyframes dots-2 {
  from {
    opacity: 0
  }
  50% {
    opacity: 1
  }
}
@keyframes dots-3 {
  from {
    opacity: 0
  }
  75% {
    opacity: 1
  }
}
@-webkit-keyframes dots-1 {
  from {
    opacity: 0
  }
  25% {
    opacity: 1
  }
}
@-webkit-keyframes dots-2 {
  from {
    opacity: 0
  }
  50% {
    opacity: 1
  }
}
@-webkit-keyframes dots-3 {
  from {
    opacity: 0
  }
  75% {
    opacity: 1
  }
}
.a-inspector-loader .dots span {
  animation: dots-1 2s infinite steps(1);
  -webkit-animation: dots-1 2s infinite steps(1);
}
.a-inspector-loader .dots span:first-child+span {
  animation-name: dots-2;
  -webkit-animation-name: dots-2;
}
.a-inspector-loader .dots span:first-child+span+span {
  animation-name: dots-3;
  -webkit-animation-name: dots-3;
}
</style>
