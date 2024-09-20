<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { ref, watch } from 'vue';
import TablePagination from '@/Components/TablePagination.vue';
import { Head, router, useForm } from '@inertiajs/vue3';
import { debounce } from 'lodash';
import { Inertia } from '@inertiajs/inertia';

const props = defineProps({
    students: Object,
    search: String,
});





const showModal = ref(false);
const mode = ref('create');
const selectedStudent = ref(null);

// Initialize the form using useForm()
const form = useForm({
    fname: '',
    lname: '',
    option: '',
    level: '',
    card_number: '',
    status: 'active',
});

Echo.channel("read-card").listen("ReadCardNumber", (e) => {
    form.card_number = e.cardNumber;
});

// Open modal in create mode
const openModal = (action) => {
    mode.value = action;
    if (action === 'create') {
        form.reset();
    }
    showModal.value = true;
};

// Open modal in edit mode and populate form with course data
const editStudent = (course) => {
    mode.value = 'edit';
    selectedStudent.value = course;
    form.fname = course.fname;
    form.lname = course.lname;
    form.option = course.option;
    form.level = course.level;
    form.card_number = course.card_number;
    form.status = course.status;
    showModal.value = true;
};

// Close modal
const closeModal = () => {
    showModal.value = false;
    form.reset();
    form.clearErrors();
};

// Submit form for both creating and editing users
const submitForm = () => {
    if (mode.value === 'create') {
        form.post(route('students.store'), {
            onSuccess: () => closeModal(),
        });
    } else {
        form.put(route('students.update', selectedStudent.value.id), {
            onSuccess: () => closeModal(),
        });
    }
};


// delete user information
const selctedId = ref();

const destroyRow = (id) => {
    selctedId.value = id; // Create a copy to avoid modifying the original user data
};
const deleteRecord = (id) => {

    form.delete(route('students.destroy', id), {
        onSuccess: () => {
            form.reset();
            Inertia.reload();
        },
        onError: (errors) => {
            console.log('error', errors);
            // Handle error responses or validation errors
        },
    });
};



const search = ref(props.search);

watch(
    search,
    debounce((q) => router.get(route('students.index'), { search: q }, { preserveState: true }), 500)
);



</script>

<template>

    <Head title="Students" />

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
                    <div
                        class="w-full md:w-auto flex flex-col md:flex-row space-y-2 md:space-y-0 items-stretch md:items-center justify-end md:space-x-3 flex-shrink-0">
                        <button v-if="$page.props.auth.user.role !== 'teacher'" type="button" @click="openModal('create')"
                            class="flex items-center justify-center text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-primary-600 dark:hover:bg-primary-700 focus:outline-none dark:focus:ring-primary-800">

                            <svg class="w-4 h-4 text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                width="24" height="24" fill="none" viewBox="0 0 24 24">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                    stroke-width="2" d="M5 12h14m-7 7V5" />
                            </svg>

                            Add Student
                        </button>

                        <!-- Main modal -->
                        <!-- Modal -->
                        <div v-if="showModal" id="static-modal"
                            class="fixed inset-0 flex justify-center items-center z-50 bg-black bg-opacity-50">
                            <div class="relative p-4 w-full max-w-2xl max-h-full">
                                <!-- Modal content -->
                                <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                    <!-- Modal header -->
                                    <div
                                        class="flex items-center justify-between px-7 py-5 border-b dark:border-gray-600">
                                        <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                            {{ mode === 'create' ? 'Create New Student' : 'Edit Student' }}
                                        </h3>

                                        <button type="button" @click="closeModal"
                                            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                            data-modal-hide="static-modal">
                                            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                fill="none" viewBox="0 0 14 14">
                                                <path stroke="currentColor" stroke-linecap="round"
                                                    stroke-linejoin="round" stroke-width="2"
                                                    d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                                            </svg>
                                            <span class="sr-only">Close modal</span>
                                        </button>
                                    </div>

                                    <!-- Modal body -->
                                    <form @submit.prevent="submitForm" class="p-4 md:p-7">
                                        <div class="grid gap-4 mb-4 grid-cols-2 mb-6">
                                            <div class="col-span-2 sm:col-span-1">
                                                <label for="fname"
                                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Course
                                                    First Name</label>
                                                <input v-model="form.fname" type="text" id="fname"
                                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                                    placeholder="Enter first name" required />
                                                <span v-if="form.errors.fname" class="text-red-500 text-sm">{{
                                                    form.errors.fname }}</span>
                                            </div>
                                            <div class="col-span-2 sm:col-span-1">
                                                <label for="lname"
                                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Course
                                                    Last Name</label>
                                                <input v-model="form.lname" type="text" id="lname"
                                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                                    placeholder="Enter last name" required />
                                                <span v-if="form.errors.lname" class="text-red-500 text-sm">{{
                                                    form.errors.lname }}</span>
                                            </div>
                                            <div class="col-span-2 sm:col-span-1">
                                                <label for="option"
                                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Option</label>
                                                <select id="option" v-model="form.option"
                                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                                    <option value="" selected disabled>Select option</option>
                                                    <option value="ICT">ICT</option>
                                                    <option value="Crop Production">Crop Production</option>
                                                    <option value="Mechanical Engineering">Mechanical Engineering
                                                    </option>
                                                    <option value="Veternary Technology">Veternary Technology</option>
                                                    <option value="EET">EET</option>
                                                    <option value="Civil Engineering">Civil Engineering</option>

                                                </select>
                                                <span v-if="form.errors.option" class="text-red-500 text-sm">{{
                                                    form.errors.option }}</span>
                                            </div>
                                            <div class="col-span-2 sm:col-span-1">
                                                <label for="level"
                                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Level</label>
                                                <select id="level" v-model="form.level"
                                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                                    <option value="" selected disabled>Select level</option>
                                                    <option value="Level 5">Level 5</option>
                                                    <option value="Level 6">Level 6</option>
                                                    <option value="Level 7">Level 7</option>

                                                </select>
                                                <span v-if="form.errors.level" class="text-red-500 text-sm">{{
                                                    form.errors.level }}</span>
                                            </div>
                                            <div class="col-span-2 sm:col-span-1">
                                                <label for="card_number"
                                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Card
                                                    Number</label>
                                                <input type="text" id="card_number" v-model="form.card_number"
                                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                                    placeholder="Tap Card ....." required="">
                                                <span v-if="form.errors.card_number" class="text-red-500 text-sm">{{
                                                    form.errors.card_number }}</span>
                                            </div>
                                            <div class="col-span-2 sm:col-span-1">
                                                <label for="status"
                                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Status</label>
                                                <select id="status" v-model="form.status"
                                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                                    <option value="active">Active</option>
                                                    <option value="inactive">Inactive</option>
                                                </select>
                                                <span v-if="form.errors.status" class="text-red-500 text-sm">{{
                                                    form.errors.status }}</span>
                                            </div>
                                        </div>
                                        <button type="submit"
                                            class="text-white inline-flex items-center bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 mb-3">
                                            {{ mode === 'create' ? 'Add new student' : 'Update student' }}
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="overflow-x-auto">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-200 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                                <th scope="col" class="px-4 py-3">#</th>
                                <th scope="col" class="px-4 py-3">Student Name</th>
                                <th scope="col" class="px-4 py-3">Reg Number</th>
                                <th scope="col" class="px-4 py-3">Option</th>
                                <th scope="col" class="px-4 py-3">Level</th>
                                <th scope="col" class="px-4 py-3">Status</th>
                                <th scope="col" class="px-4 py-3">Join Date</th>
                                <th v-if="$page.props.auth.user.role !== 'teacher'" scope="col" class="px-4 py-3">
                                    <span class="sr-only">Actions</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <template v-if="students.data.length > 0">
                                <tr v-for="(student, index) in students.data" :key="student.id"
                                    class="border-b dark:border-gray-700">
                                    <th scope="row"
                                        class="px-4 py-3 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        {{ (students.current_page - 1) * students.per_page + index + 1 }}
                                    </th>
                                    <td class="px-4 py-3">{{ student.fname }} {{ student.lname }}</td>
                                    <td class="px-4 py-3">{{ student.reg_number }}</td>
                                    <td class="px-4 py-3">{{ student.option }}</td>
                                    <td class="px-4 py-3">{{ student.level }}</td>
                                    <td class="px-4 py-3">
                                        <div class="flex items-center">
                                            <template v-if="student.status === 'active'">
                                                <div class="h-2.5 w-2.5 rounded-full bg-green-500 me-2"></div> Active
                                            </template>
                                            <template v-else>
                                                <div class="h-2.5 w-2.5 rounded-full bg-red-500 me-2"></div> Inactive
                                            </template>
                                        </div>


                                    </td>
                                    <td class="px-4 py-3">{{ new
                                        Date(student.created_at).toLocaleDateString('en-US', {
                                            month: 'long', day:
                                                '2-digit', year: 'numeric'
                                        }) }}
                                    </td>

                                    <td v-if="$page.props.auth.user.role !== 'teacher'" class="px-4 py-3 flex items-center justify-end gap-2">
                                        <button type="button" @click="editStudent(student)"
                                            class="px-3 py-2 text-xs font-medium text-center inline-flex items-center text-white bg-blue-700 rounded-md hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">

                                            <svg class="w-4 h-4 text-white me-1" aria-hidden="true"
                                                xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                                                viewBox="0 0 24 24">
                                                <path stroke="currentColor" stroke-linecap="round"
                                                    stroke-linejoin="round" stroke-width="2"
                                                    d="m14.304 4.844 2.852 2.852M7 7H4a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h11a1 1 0 0 0 1-1v-4.5m2.409-9.91a2.017 2.017 0 0 1 0 2.853l-6.844 6.844L8 14l.713-3.565 6.844-6.844a2.015 2.015 0 0 1 2.852 0Z" />
                                            </svg>

                                            Edit
                                        </button>
                                        <button type="button" @click="destroyRow(student.id)"
                                            data-modal-target="popup-modal" data-modal-toggle="popup-modal"
                                            class="px-3 py-2 text-xs font-medium text-center inline-flex items-center text-white bg-red-700 rounded-md hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800">

                                            <svg class="w-4 h-4 text-white me-1" aria-hidden="true"
                                                xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                                                viewBox="0 0 24 24">
                                                <path stroke="currentColor" stroke-linecap="round"
                                                    stroke-linejoin="round" stroke-width="2"
                                                    d="M5 7h14m-9 3v8m4-8v8M10 3h4a1 1 0 0 1 1 1v3H9V4a1 1 0 0 1 1-1ZM6 7h12v13a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7Z" />
                                            </svg>

                                            Delete
                                        </button>
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
                <TablePagination :links="students" />

            </div>
            <div id="popup-modal" tabindex="-1"
                class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                <form action="" @submit.prevent="deleteRecord(selctedId)">
                    <div class="relative p-4 w-full max-w-md max-h-full">
                        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                            <button type="button"
                                class="absolute top-3 end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                data-modal-hide="popup-modal">
                                <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                    viewBox="0 0 14 14">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                        stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                                </svg>
                                <span class="sr-only">Close modal</span>
                            </button>
                            <div class="p-4 md:p-5 text-center">
                                <svg class="mx-auto mb-4 text-gray-400 w-12 h-12 dark:text-gray-200" aria-hidden="true"
                                    xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                        stroke-width="2" d="M10 11V6m0 8h.01M19 10a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                                </svg>
                                <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Are you sure you
                                    want
                                    to delete
                                    this course?</h3>
                                <button
                                    class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 dark:focus:ring-red-800 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center">
                                    Yes, I'm sure
                                </button>
                                <button data-modal-hide="popup-modal" type="button"
                                    class="py-2.5 px-5 ms-3 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">No,
                                    cancel</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </AuthenticatedLayout>
</template>
