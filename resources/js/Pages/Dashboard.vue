<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
defineProps({
    overview: Object,
});
</script>

<template>

    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <section class="bg-white antialiased dark:bg-gray-900 p-6 mb-4">
            <h2 class="mb-4 text-xl font-semibold text-gray-900 dark:text-white sm:text-2xl md:mb-6">General
                overview</h2>
            <div class="grid grid-cols-2 gap-3 dark:border-gray-700 lg:grid-cols-4">
                <div class="border p-3 rounded-lg">
                    <div class="flex">
                        <svg class="mb-2 h-8 w-8 text-green-400 dark:text-green-500 me-1" aria-hidden="true"
                            xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="m11.5 11.5 2.071 1.994M4 10h5m11 0h-1.5M12 7V4M7 7V4m10 3V4m-7 13H8v-2l5.227-5.292a1.46 1.46 0 0 1 2.065 2.065L10 17Zm-5 3h14a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1Z" />
                        </svg>

                        <h3 class="mb-2 text-2xl text-gray-500 font-bold dark:text-gray-400">Users</h3>
                    </div>

                    <span class="flex items-center text-4xl text-gray-900 dark:text-white">{{ overview.users }}
                    </span>

                </div>
                <div class="border p-3 rounded-lg">
                    <div class="flex">
                        <svg class="mb-2 h-8 w-8 text-red-400 dark:text-red-500 me-1" aria-hidden="true"
                            xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M4 10h16M8 14h8m-4-7V4M7 7V4m10 3V4M5 20h14a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1Z" />
                        </svg>

                        <h3 class="mb-2 text-2xl text-gray-500 font-bold dark:text-gray-400">Teachers</h3>
                    </div>

                    <span class="flex items-center text-4xl text-gray-900 dark:text-white">{{ overview.teachers }}
                    </span>

                </div>
                <div class="border p-3 rounded-lg">
                    <div class="flex">
                        <svg class="w-8 h-8 text-blue-600 dark:text-white me-1" aria-hidden="true"
                            xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                            <path stroke="currentColor" stroke-linecap="round" stroke-width="2"
                                d="M9 8h10M9 12h10M9 16h10M4.99 8H5m-.02 4h.01m0 4H5" />
                        </svg>

                        <h3 class="mb-2 text-2xl text-gray-500 font-bold  dark:text-gray-400">Courses</h3>
                    </div>

                    <span class="flex items-center text-4xl text-gray-900 dark:text-white">{{ overview.courses }}
                    </span>

                </div>
                <div class="border p-3 rounded-lg">
                    <div class="flex">
                        <svg class="w-8 h-8 text-yellow-500 dark:text-white me-1" aria-hidden="true"
                            xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                            <path stroke="currentColor" stroke-linecap="round" stroke-width="2"
                                d="M16 19h4a1 1 0 0 0 1-1v-1a3 3 0 0 0-3-3h-2m-2.236-4a3 3 0 1 0 0-4M3 18v-1a3 3 0 0 1 3-3h4a3 3 0 0 1 3 3v1a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1Zm8-10a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                        </svg>

                        <h3 class="mb-2 text-2xl text-gray-500 font-bold dark:text-gray-400">Students</h3>
                    </div>

                    <span class="flex items-center text-4xl text-gray-900 dark:text-white">{{ overview.students }}
                    </span>

                </div>

            </div>
        </section>
    </AuthenticatedLayout>
</template>
