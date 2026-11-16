class Course {
  String code;
  String title;
  int creditHours;

  Course(this.code, this.title, this.creditHours);
}

class Student {
  String name;
  String id;
  List<Course> registeredCourses = [];

  Student(this.name, this.id);

  void registerCourse(Course course) {
    // check if course is already registered
    for (var c in registeredCourses) {
      if (c.code == course.code) {
        print('Already registered for ${course.code}');
        return;
      }
    }
    registeredCourses.add(course);
    print('Registered: ${course.code} - ${course.title}');
  }

  int getTotalCredits() {
    int total = 0;
    for (var c in registeredCourses) {
      total += c.creditHours;
    }
    return total;
  }

  void displayCourses() {
    print('\n--- Registered Courses for $name ($id) ---');
    for (var c in registeredCourses) {
      print('${c.code}: ${c.title} (${c.creditHours} credits)');
    }
    print('Total Credits: ${getTotalCredits()}\n');
  }
}

void main() {
  var c1 = Course('IRE 460', 'Mobile Platform for IoT Devices', 3);
  var c2 = Course('IRE 462', 'Sensor Interfacing Lab', 2);
  var c3 = Course('IRE 484', 'Artificial Intelligence', 3);

  var student = Student('Shahriar Alom Masud', '2201032');

  student.registerCourse(c1);
  student.registerCourse(c2);
  student.registerCourse(c3);
  student.registerCourse(c1); // duplicate test

  student.displayCourses();
}
