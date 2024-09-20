<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { ref, watch } from 'vue';
import TablePagination from '@/Components/TablePagination.vue';
import { Head, Link, router, useForm } from '@inertiajs/vue3';
import { debounce } from 'lodash';
import { Inertia } from '@inertiajs/inertia';

const props = defineProps({
    courses: Object,
    search: String,
    option: String,
});



const option = ref(props.option);
const search = ref(props.search);

watch(
    search,
    debounce((q) => router.get(route('options_list'), { search: q, option: option.value }, { preserveState: true }), 500)
);


</script>

<template>

    <Head title="Courses" />

    <AuthenticatedLayout>
        <section class="bg-gray-50 dark:bg-gray-900">
            <!-- Start coding here -->
            <div class="bg-white dark:bg-gray-800 relative shadow-md sm:rounded-lg overflow-hidden">
                <div
                    class="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0 md:space-x-4 p-4">
                    <div class="w-full md:w-1/3">
                        <form class="flex items-center">
                            <label for="simple-search" class="sr-only">Search</label>
                            <div class="relative w-full">
                                <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                    <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400"
                                        fill="currentColor" viewbox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                            d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                            clip-rule="evenodd" />
                                    </svg>
                                </div>
                                <input type="text" id="simple-search" v-model="search"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full pl-10 p-2 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                    placeholder="Search" required="">
                            </div>
                        </form>
                    </div>

                </div>
                <div class="overflow-x-auto">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                                <th scope="col" class="px-4 py-3">#</th>
                                <th scope="col" class="px-4 py-3">Course Name</th>
                                <th scope="col" class="px-4 py-3">Option</th>
                                <th scope="col" class="px-4 py-3">Level</th>
                                <th scope="col" class="px-4 py-3">Teacher</th>
                                <th scope="col" class="px-4 py-3">
                                    <span class="sr-only">Actions</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <template v-if="courses.data.length > 0">
                                <tr v-for="(course, index) in courses.data" :key="course.id"
                                    class="border-b dark:border-gray-700">
                                    <th scope="row"
                                        class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        {{ (courses.current_page - 1) * courses.per_page + index + 1 }}
                                    </th>
                                    <td class="px-4 py-3">{{ course.name }}</td>
                                    <td class="px-4 py-3">{{ course.option }}</td>
                                    <td class="px-4 py-3">{{ course.level }}</td>
                                    <td class="px-4 py-3">{{ course.user.name }}</td>

                                    <td class="px-4 py-3">
                                        <Link :href="route('attendences', course.id)"
                                            class="font-medium text-blue-600 dark:text-blue-500 hover:underline">
                                        Students</Link>
                                    </td>
                                </tr>
                            </template>
                            <template v-else>
                                <tr>
                                    <td colspan="7" class="px-4 py-3 text-center">No records found</td>
                                </tr>
                            </template>

                        </tbody>
                    </table>
                </div>
                <TablePagination :links="courses" />

            </div>

        </section>
    </AuthenticatedLayout>
</template>
