# Lab 04: Object-Oriented Programming in Dart

Course Code: IRE 460  
Course Title: Mobile Platform for IoT Devices Sessional  
Department: Department of Internet of Things and Robotics Engineering (IRE)  
Faculty: Faculty of Cyber Physical System Engineering  
Institution: University of Frontier Technology, Bangladesh (UFTB)  

Author: Shahriar Alom Masud  
Student ID: 2201032  
Session: 2022-2023  
Instructor: Md. Rafiqul Islam, Lecturer, Dept. of IRE, UFTB  

---

## Laboratory Tasks Overview

### Task 1: Student Result Management System
- Class `Student` and class `Subject`.
- Methods to calculate average marks and determine grade (A, B, C, F).
- Display student details with results.

### Task 2: University Course Registration
- Class `Course` and class `Student`.
- Registration logic preventing duplicate enrollments.
- Display registered courses and total credit hours.

### Task 3: Hospital Appointment Scheduler
- Class `Doctor` and class `Patient`.
- Booking logic with conflict checking to prevent double-booking.
- Display schedule and appointment summary.

---

## Project Structure

```text
Lab_04/
├── src/
│   ├── task1_student_result.dart        # Task 1 Dart implementation
│   ├── task2_course_registration.dart   # Task 2 Dart implementation
│   └── task3_hospital_scheduler.dart    # Task 3 Dart implementation
├── submission_report/
│   ├── build.sh                         # 1-Click build script
│   ├── main.tex                         # LaTeX report source
│   ├── 2201032_Report_4.pdf             # Final compiled 5-page submission PDF
│   └── screenshots/
│       └── uftb_logo.png
└── README.md
```

---

## Running the Tasks

```bash
# Run Task 1
dart run src/task1_student_result.dart

# Run Task 2
dart run src/task2_course_registration.dart

# Run Task 3
dart run src/task3_hospital_scheduler.dart
```

---

## Compiling the Report PDF

```bash
cd submission_report
bash build.sh
```
Compiled Output: `submission_report/2201032_Report_4.pdf`
