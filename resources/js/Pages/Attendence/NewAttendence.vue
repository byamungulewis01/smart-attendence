<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { onBeforeUnmount, onMounted, ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import { Inertia } from '@inertiajs/inertia';
import axios from 'axios';

const props = defineProps({
    course: Object,
    attendences: Object
});
const students = ref(props.attendences);

Echo.channel("read-card").listen("ReadCardNumber", (e) => {

    axios.post(route('store_attendence', e.cardNumber), {
        course: props.course.id,
    })
        .then((response) => {
            students.value = response.data;

        }).catch((error) => {
            log.error('error', error);
        });

});


const minutes = ref(10); // Initial countdown time in minutes
const seconds = ref(0); // Seconds start at 0
let interval = null;

// Countdown logic
const startCountdown = () => {
    interval = setInterval(() => {
        if (seconds.value === 0) {
            if (minutes.value === 0) {
                clearInterval(interval);
                submitAttendence();
            } else {
                minutes.value--;
                seconds.value = 59;
            }
        } else {
            seconds.value--;
        }
    }, 1000);
};

// Increment and decrement time buttons
const incrementTime = () => {
    minutes.value++;
};

const decrementTime = () => {
    if (minutes.value > 0) {
        minutes.value--;
    }
};
const submitAttendence = () => {
    Inertia.post(route('submit_attendence', props.course),);
};

// Start the countdown when the component is mounted
onMounted(() => {
    startCountdown();
});

// Clean up the interval when the component is destroyed
onBeforeUnmount(() => {
    clearInterval(interval);
});
</script>

<template>

    <Head title="Students" />

    <AuthenticatedLayout>
        <section class="bg-gray-50 dark:bg-gray-900">
            <!-- Start coding here -->
            <div class="bg-white dark:bg-gray-800 relative shadow-md sm:rounded-lg overflow-hidden">
                <div
                    class="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0 md:space-x-4 p-4">
                    <div class="w-50">
                        <h4 class="text-lg font-bold text-gray-900 dark:text-white">List of Students</h4>
                        <span
                            class="bg-blue-100 text-blue-800 text-md font-medium inline-flex items-center px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-blue-400 border border-blue-400">

                            <svg class="w-4 h-4 me-1.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24"
                                height="24" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M11 9a1 1 0 1 1 2 0 1 1 0 0 1-2 0Z" />
                                <path fill-rule="evenodd"
                                    d="M9.896 3.051a2.681 2.681 0 0 1 4.208 0c.147.186.38.282.615.255a2.681 2.681 0 0 1 2.976 2.975.681.681 0 0 0 .254.615 2.681 2.681 0 0 1 0 4.208.682.682 0 0 0-.254.615 2.681 2.681 0 0 1-2.976 2.976.681.681 0 0 0-.615.254 2.682 2.682 0 0 1-4.208 0 .681.681 0 0 0-.614-.255 2.681 2.681 0 0 1-2.976-2.975.681.681 0 0 0-.255-.615 2.681 2.681 0 0 1 0-4.208.681.681 0 0 0 .255-.615 2.681 2.681 0 0 1 2.976-2.975.681.681 0 0 0 .614-.255ZM12 6a3 3 0 1 0 0 6 3 3 0 0 0 0-6Z"
                                    clip-rule="evenodd" />
                                <path
                                    d="M5.395 15.055 4.07 19a1 1 0 0 0 1.264 1.267l1.95-.65 1.144 1.707A1 1 0 0 0 10.2 21.1l1.12-3.18a4.641 4.641 0 0 1-2.515-1.208 4.667 4.667 0 0 1-3.411-1.656Zm7.269 2.867 1.12 3.177a1 1 0 0 0 1.773.224l1.144-1.707 1.95.65A1 1 0 0 0 19.915 19l-1.32-3.93a4.667 4.667 0 0 1-3.4 1.642 4.643 4.643 0 0 1-2.53 1.21Z" />
                            </svg>
                            {{ course.name }}
                        </span>
                    </div>
                    <div class="bg-white dark:bg-gray-800 flex justify-center items-center gap-3">
                        <div>
                            <div class="relative flex items-center max-w-[8rem]">
                                <button type="button" @click="decrementTime"
                                    class="bg-gray-100 dark:bg-gray-700 dark:hover:bg-gray-600 dark:border-gray-600 hover:bg-gray-200 border border-gray-300 rounded-s-lg p-3 h-11 focus:ring-gray-100 dark:focus:ring-gray-700 focus:ring-2 focus:outline-none">
                                    <svg class="w-3 h-3 text-gray-900 dark:text-white" aria-hidden="true"
                                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 2">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                            stroke-width="2" d="M1 1h16" />
                                    </svg>
                                </button>

                                <button type="button" @click="incrementTime"
                                    class="bg-gray-100 dark:bg-gray-700 dark:hover:bg-gray-600 dark:border-gray-600 hover:bg-gray-200 border border-gray-300 rounded-e-lg p-3 h-11 focus:ring-gray-100 dark:focus:ring-gray-700 focus:ring-2 focus:outline-none">
                                    <svg class="w-3 h-3 text-gray-900 dark:text-white" aria-hidden="true"
                                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                            stroke-width="2" d="M9 1v16M1 9h16" />
                                    </svg>
                                </button>
                            </div>
                        </div>
                        <div>
                            <h2 class="font-extrabold text-gray-700 dark:text-gray-300 mb-2">
                                TIME REMAINING</h2>
                            <div class="flex space-x-3 justify-start text-center">


                                <div class="flex-1 border-2 border-gray-300 dark:border-gray-700 p-2 rounded-lg">
                                    <div class="text-2xl font-extrabold text-gray-800 dark:text-gray-200">{{ minutes }}
                                    </div>
                                    <div class="text-sm uppercase tracking-wider text-gray-600 dark:text-gray-400">
                                        Minutes</div>
                                </div>
                                <div class="flex-1 border-2 border-gray-300 dark:border-gray-700 p-2 rounded-lg">
                                    <div class="text-2xl font-extrabold text-gray-800 dark:text-gray-200">{{ seconds }}
                                    </div>
                                    <div class="text-sm uppercase tracking-wider text-gray-600 dark:text-gray-400">
                                        Seconds</div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="overflow-x-auto">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-200 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                                <th scope="col" class="px-4 py-3 w-1">#</th>
                                <th scope="col" class="px-4 py-3">Student Name</th>
                                <th scope="col" class="px-4 py-3">Reg Number</th>
                                <th scope="col" class="px-4 py-3">Time in</th>
                                <th scope="col" class="px-4 py-3">
                                    <span class="sr-only">Actions</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item, index) in students" :key="index" class="border-b dark:border-gray-700">
                                <th scope="row"
                                    class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                    {{ index + 1 }}
                                </th>
                                <td class="px-4 py-3">{{ item.student.fname }} {{ item.student.lname }}</td>
                                <td class="px-4 py-3">{{ item.student.reg_number }}</td>
                                <td class="px-4 py-3">{{ new Date(item.created_at).toLocaleTimeString('en-US', {
                                    hour: '2-digit',
                                    minute: '2-digit',
                                    hour12: true
                                }) }}
                                </td>

                            </tr>

                        </tbody>
                    </table>
                </div>

            </div>

        </section>

    </AuthenticatedLayout>
</template>
