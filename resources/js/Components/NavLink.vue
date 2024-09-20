<script setup>
import { computed } from 'vue';
import { Link } from '@inertiajs/vue3';

const props = defineProps({
    href: {
        type: String,
        required: true,
    },
    active: {
        type: Boolean,
    },
});

const classes = computed(() =>
    props.active
        ? 'flex items-center p-2 text-white font-medium text-white rounded-lg dark:text-white hover:bg-blue-600 dark:hover:bg-blue-600 group bg-blue-700 dark:bg-blue-700'
        : 'flex items-center p-2 text-base font-medium text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group'
);
</script>

<template>
    <Link :href="href" :class="classes">
        <slot />
    </Link>
</template>
