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
</template>
