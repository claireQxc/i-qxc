<script setup lang="ts">
import type { CardButton } from '~/interfaces/card'
const props = defineProps<{
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
    <div block-btn w-60 @click="openTab(card.url)">
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
