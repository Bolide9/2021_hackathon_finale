<template>
  <Transition name="fade">
    <div v-if="$slots.default" class="modal" @click="$emit('click-outside')">
      <div class="content">
        <div class="inner" @click.stop>
          <slot />
        </div>
      </div>
    </div>
  </Transition>
</template>

<style lang="scss" scoped>
.modal {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 10;
  overflow: auto;
}
.content {
  position: relative;
  display: flex;
  padding: 20px;
  align-items: center;
  justify-content: center;
  min-height: 100%;
}
.inner {
  position: relative;
  border-radius: 24px;
  background-color: #0F1115;
  border: 1px solid #2C303A;
  padding: 60px 32px;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
.slide-enter-active, .slide-leave-active {
  transition: transform 0.3s;
}
.slide-enter, .slide-leave-to {
  transform: translateY(30px) scale(0.5);
}
</style>
