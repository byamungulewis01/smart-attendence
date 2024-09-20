<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { computed } from 'vue';
import { Head, Link} from '@inertiajs/vue3';
import { format } from 'date-fns';  // Optional: for date formatting

const props = defineProps({
    attendances: Object,
    course: Object,
    isAttendanceDone : Boolean
});

const attendances = props.attendances;


// Format the date to 'm-d'
const formatDate = (date) => format(new Date(date), 'MM-dd');

// Helper function to generate a unique list of students
const studentList = computed(() => {
    const studentMap = new Map();
    Object.values(attendances).forEach(records => {
        records.forEach(record => {
            studentMap.set(record.reg_number, {
                name: record.student_name,
                reg_number: record.reg_number
            });
        });
    });
    return Array.from(studentMap.values());
});

// Helper function to get the status for a student on a specific date
const getStatusForDate = (regNumber, date) => {
    const attendanceRecords = attendances[date];
    const studentRecord = attendanceRecords?.find(record => record.reg_number === regNumber);
    return studentRecord ? studentRecord.status : null;
};

// Calculate the attendance percentage for a student
const calculatePercentage = (regNumber) => {
    const totalSessions = Object.keys(attendances).length;
    let presentCount = 0;

    Object.values(attendances).forEach(records => {
        const studentRecord = records.find(record => record.reg_number === regNumber);
        if (studentRecord && studentRecord.status === 'present') {
            presentCount++;
        }
    });

    const percentage = (presentCount / totalSessions) * 100;
    return percentage.toFixed(2);  // Return a fixed 2 decimal point percentage
};
</script>

<template>

    <Head title="Students" />

    <AuthenticatedLayout>
        <section class="bg-gray-50 dark:bg-gray-900">
            <!-- Start coding here -->
            <div class="bg-white dark:bg-gray-800 relative shadow-md sm:rounded-lg overflow-hidden">
                <div
                    class="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0 md:space-x-4 p-4">
                    <h4 class="text-lg font-bold text-gray-900 dark:text-white">List of Students</h4>
                    <Link v-if="$page.props.auth.user.role === 'teacher' && !isAttendanceDone" :href="route('new_attendences', course)"
                        class="flex items-center justify-center text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-primary-600 dark:hover:bg-primary-700 focus:outline-none dark:focus:ring-primary-800">
                        Add Attendence
                    </Link>
                </div>
                <div class="overflow-x-auto">

                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-200 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                                <th scope="col" class="px-4 py-3 w-1">#</th>
                                <th scope="col" class="px-4 py-3" style="width: 18%;">Student Name</th>
                                <th scope="col" class="px-4 py-3" style="width: 10%;">Reg Number</th>
                                <th scope="col" class="px-4 py-3" v-for="(attendance, date) in attendances" :key="date">
                                    {{ formatDate(date) }}</th>
                                <th scope="col" class="px-4 py-3">Percentage (%)</th> <!-- New column for percentage -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="border-b dark:border-gray-700" v-for="(student, index) in studentList"
                                :key="index">
                                <td class="px-4 py-3">{{ index + 1 }}</td>
                                <td class="px-4 py-3">{{ student.name }}</td>
                                <td class="px-4 py-3">{{ student.reg_number }}</td>
                                <td class="px-4 py-3" v-for="(attendance, date) in attendances" :key="date">
                                    <span v-if="getStatusForDate(student.reg_number, date) === 'present'">
                                        ✔️
                                    </span>
                                    <span v-else>❌</span>
                                </td>
                                <td class="px-4 py-3">{{ calculatePercentage(student.reg_number) }}%</td>
                                <!-- Display percentage -->
                            </tr>
                        </tbody>
                    </table>

                </div>

            </div>

        </section>


    </AuthenticatedLayout>
</template>
