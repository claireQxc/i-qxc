<script setup lang="ts">
const openTab = (url) => {
  if (url)
    window.open(url)
}
</script>

<template>
  <div font-mono>
    GAMES
  </div>
  <div flex="~">
    <div block-btn w-60 @click="openTab('http://www.i-qxc.com/sweeper/')">
      <div flex="~ gap1" font-mono>
        <div i-mdi-mine />
        Minesweeper
      </div>
      <div desc-txt>
        Playing minesweeper is our passion. That's why we strive to make it the greatest game in the world!
      </div>
    </div>
  </div>
</template>
