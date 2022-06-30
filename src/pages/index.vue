<script setup lang="ts">
const blocks = $ref('')
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
    <div font-mono text-xl hover:opacity-100 hover:text-red-500>
      i-qxc
    </div>
    <div flex="~ gap5" justify-end>
      <div icon-btn i-carbon-game-wireless text-xl @click="go('games')" />
      <div icon-btn i-carbon-tool-kit text-xl @click="go('tools')" />
      <div icon-btn i-carbon-document text-xl @click="go('docs')" />
    </div>
  </div>
  <div font-mono text-2xl>
    BUILDING...
  </div>
</template>
