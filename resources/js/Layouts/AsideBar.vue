<script setup>
import NavLink from '@/Components/NavLink.vue';
import { Link } from '@inertiajs/vue3';
import axios from 'axios';
import { onMounted, ref } from 'vue';
// Define a ref to hold the options
const options = ref([]);

// Function to fetch course options
const getOptions = async () => {
    try {
        const response = await axios.get(route('options'));
        options.value = response.data;
    } catch (error) {
        console.error('Error fetching course options:', error);
    }
};
// Fetch the options when the component is mounted
onMounted(() => {
    getOptions();
});
</script>

<template>
    <aside
        class="fixed top-0 left-0 z-40 w-64 h-screen pt-14 transition-transform -translate-x-full bg-white border-r border-gray-200 md:translate-x-0 dark:bg-gray-800 dark:border-gray-700"
        aria-label="Sidenav" id="drawer-navigation">
        <div class="overflow-y-auto py-5 px-3 h-full bg-white dark:bg-gray-800">
            <form action="#" method="GET" class="md:hidden mb-2">
                <label for="sidebar-search" class="sr-only">Search</label>
                <div class="relative">
                    <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                        <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd"
                                d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z">
                            </path>
                        </svg>
                    </div>
                    <input type="text" name="search" id="sidebar-search"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full pl-10 p-2 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                        placeholder="Search" />
                </div>
            </form>
            <ul class="space-y-2">
                <li>
                    <NavLink :href="route('dashboard')" :active="route().current('dashboard')">
                        <svg aria-hidden="true"
                            :class="{ 'text-white': route().current('dashboard'), 'text-gray-500 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white': !route().current('dashboard') }"
                            class="w-6 h-6 transition duration-75" fill="currentColor" viewBox="0 0 20 20"
                            xmlns="http://www.w3.org/2000/svg">
                            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                        </svg>
                        <span class="ml-3">Overview</span>
                    </NavLink>
                </li>
                <li v-if="$page.props.auth.user.role !== 'teacher'">
                    <NavLink :href="route('users.index')" :active="route().current('users.index')">
                        <svg :class="{ 'text-white': route().current('users.index'), 'text-gray-500 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white': !route().current('users.index') }"
                            class="w-6 h-6 transition duration-75" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                            width="24" height="24" fill="none" viewBox="0 0 24 24">
                            <path stroke="currentColor" stroke-linecap="round" stroke-width="2"
                                d="M16 19h4a1 1 0 0 0 1-1v-1a3 3 0 0 0-3-3h-2m-2.236-4a3 3 0 1 0 0-4M3 18v-1a3 3 0 0 1 3-3h4a3 3 0 0 1 3 3v1a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1Zm8-10a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                        </svg>

                        <span class="ml-3">Users</span>
                    </NavLink>
                </li>
                <li v-if="$page.props.auth.user.role !== 'teacher'">
                    <NavLink :href="route('teachers.index')" :active="route().current('teachers.index')">

                        <svg :class="{ 'text-white': route().current('teachers.index'), 'text-gray-500 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white': !route().current('teachers.index') }"
                            class="w-6 h-6 transition duration-75" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                            width="24" height="24" fill="none" viewBox="0 0 24 24">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M12 21a9 9 0 1 0 0-18 9 9 0 0 0 0 18Zm0 0a8.949 8.949 0 0 0 4.951-1.488A3.987 3.987 0 0 0 13 16h-2a3.987 3.987 0 0 0-3.951 3.512A8.948 8.948 0 0 0 12 21Zm3-11a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                        </svg>

                        <span class="ml-3">Teachers</span>

                    </NavLink>
                </li>
                <li>
                    <NavLink :href="route('courses.index')" :active="route().current('courses.index')">
                        <svg :class="{ 'text-white': route().current('courses.index'), 'text-gray-500 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white': !route().current('courses.index') }"
                            class="w-6 h-6 transition duration-75" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                            width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M11 9a1 1 0 1 1 2 0 1 1 0 0 1-2 0Z" />
                            <path fill-rule="evenodd"
                                d="M9.896 3.051a2.681 2.681 0 0 1 4.208 0c.147.186.38.282.615.255a2.681 2.681 0 0 1 2.976 2.975.681.681 0 0 0 .254.615 2.681 2.681 0 0 1 0 4.208.682.682 0 0 0-.254.615 2.681 2.681 0 0 1-2.976 2.976.681.681 0 0 0-.615.254 2.682 2.682 0 0 1-4.208 0 .681.681 0 0 0-.614-.255 2.681 2.681 0 0 1-2.976-2.975.681.681 0 0 0-.255-.615 2.681 2.681 0 0 1 0-4.208.681.681 0 0 0 .255-.615 2.681 2.681 0 0 1 2.976-2.975.681.681 0 0 0 .614-.255ZM12 6a3 3 0 1 0 0 6 3 3 0 0 0 0-6Z"
                                clip-rule="evenodd" />
                            <path
                                d="M5.395 15.055 4.07 19a1 1 0 0 0 1.264 1.267l1.95-.65 1.144 1.707A1 1 0 0 0 10.2 21.1l1.12-3.18a4.641 4.641 0 0 1-2.515-1.208 4.667 4.667 0 0 1-3.411-1.656Zm7.269 2.867 1.12 3.177a1 1 0 0 0 1.773.224l1.144-1.707 1.95.65A1 1 0 0 0 19.915 19l-1.32-3.93a4.667 4.667 0 0 1-3.4 1.642 4.643 4.643 0 0 1-2.53 1.21Z" />
                        </svg>

                        <span class="ml-3">Courses</span>
                    </NavLink>
                </li>
                <li v-if="$page.props.auth.user.role !== 'teacher'">
                    <NavLink :href="route('students.index')" :active="route().current('students.index')">
                        <svg :class="{ 'text-white': route().current('students.index'), 'text-gray-500 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white': !route().current('students.index') }"
                            class="w-6 h-6 transition duration-75" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                            width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                            <path fill-rule="evenodd"
                                d="M12 20a7.966 7.966 0 0 1-5.002-1.756l.002.001v-.683c0-1.794 1.492-3.25 3.333-3.25h3.334c1.84 0 3.333 1.456 3.333 3.25v.683A7.966 7.966 0 0 1 12 20ZM2 12C2 6.477 6.477 2 12 2s10 4.477 10 10c0 5.5-4.44 9.963-9.932 10h-.138C6.438 21.962 2 17.5 2 12Zm10-5c-1.84 0-3.333 1.455-3.333 3.25S10.159 13.5 12 13.5c1.84 0 3.333-1.455 3.333-3.25S13.841 7 12 7Z"
                                clip-rule="evenodd" />
                        </svg>

                        <span class="ml-3">Students</span>
                    </NavLink>
                </li>

                <li>
                    <span class="ml-3 text-sm text-gray-400">Attendences</span>
                </li>
                <li v-for="item in options" :key="item.option">
                    <Link :href="route('options_list', { option: item.option })" :class="{
                        'flex items-center p-2 w-full text-base font-medium text-white bg-blue-600 rounded-lg transition duration-75 group dark:bg-gray-700': route().current('options_list', { option: item.option }),
                        'flex items-center p-2 w-full text-base font-medium text-gray-900 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700': !route().current('options_list', { option: item.option })
                    }">
                    <svg aria-hidden="true" :class="{
                        'flex-shrink-0 w-6 h-6 text-white': route().current('options_list', { option: item.option }),
                        'flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900 dark:text-gray-400 dark:group-hover:text-white': !route().current('options_list', { option: item.option })
                    }" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z"
                            clip-rule="evenodd"></path>
                    </svg>
                    <span class="flex-1 ml-1 text-left whitespace-nowrap">{{ item.option }}</span>
                    </Link>
                </li>


            </ul>

        </div>

    </aside>
</template>
