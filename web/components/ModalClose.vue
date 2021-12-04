<template>
  <button class="modal-close" v-on="$listeners" />
</template>

<style lang="scss" scoped>
.modal-close {
  position: absolute;
  top: 20px;
  right: 32px;
  width: 44px;
  height: 44px;
  border-radius: 50%;
  background-color: transparent;
  border: 2px solid #2C303A;

  &:before, &:after {
    content: '';
    position: absolute;
    width: 24px;
    height: 2px;
    background-color: #fff;
    left: 8px;
  }

  &:before {
    transform: rotate(45deg);
  }

  &:after {
    transform: rotate(135deg);
  }
}
</style>
