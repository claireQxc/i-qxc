<script setup lang="ts">
import type { CardButton } from '~/interfaces/card'
defineProps<{
  card: CardButton
}>()
const emit = defineEmits<{
  (e: 'cardClicked', url: string): void
}>()

function openTab(url: string) {
  emit('cardClicked', url)
}
</script>

<template>
  <div flex="~">
    <div block-btn justify-center @click="openTab(card.url)">
      <div flex="~ gap1" font-mono>
        <div :class="card.icon" />
        {{ card.title }}
      </div>
      <div desc-txt>
        {{ card.desc }}
      </div>
    </div>
  </div>
</template>
