<script setup>

import { Link } from '@inertiajs/vue3';
import NavBar from './NavBar.vue';
import AsideBar from './AsideBar.vue';
import { onMounted } from 'vue';
import { initFlowbite } from 'flowbite';
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
import { computed, watch } from 'vue';
import { usePage } from '@inertiajs/vue3';

const page = usePage();

const props = computed(() => page.props);

watch(props, (newProps) => {
  if (newProps.flash.message) {
    toast(newProps.flash.message, {
      theme: 'dark',
      type: 'success',
      dangerouslyHTMLString: true,
    });
  }
  if (newProps.flash.warning) {
    toast(newProps.flash.warning, {
      theme: 'dark',
      type: 'warning',
      dangerouslyHTMLString: true,
    });
  }
  if (newProps.flash.error) {
    toast(newProps.flash.error, {
      theme: 'dark',
      type: 'error',
      dangerouslyHTMLString: true,
    });
  }
}, { immediate: true });
// initialize components based on data attribute selectors
onMounted(() => {
    initFlowbite();
})

</script>

<template>
    <div class="antialiased bg-gray-50 dark:bg-gray-900">

        <NavBar />
        <AsideBar />
        <main class="p-4 md:ml-64 h-auto pt-20">
            <slot />
        </main>
    </div>
</template>
