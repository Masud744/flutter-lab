class Subject {
  String name;
  double marks;

  Subject(this.name, this.marks);
}

class Student {
  String name;
  String id;
  List<Subject> subjects = [];

  Student(this.name, this.id);

  void addSubject(String subjectName, double marks) {
    subjects.add(Subject(subjectName, marks));
  }

  double calculateAverage() {
    if (subjects.isEmpty) return 0.0;
    double sum = 0;
    for (var s in subjects) {
      sum += s.marks;
    }
    return sum / subjects.length;
  }

  String getGrade() {
    double avg = calculateAverage();
    if (avg >= 80) return 'A';
    if (avg >= 60) return 'B';
    if (avg >= 40) return 'C';
    return 'F';
  }

  void displayResult() {
    print('--- Student Result ---');
    print('Name: $name (ID: $id)');
    for (var s in subjects) {
      print('  ${s.name}: ${s.marks}');
    }
    print('Average: ${calculateAverage().toStringAsFixed(2)} | Grade: ${getGrade()}\n');
  }
}

void main() {
  var s1 = Student('Shahriar Alom Masud', '2201032');
  s1.addSubject('Mobile Computing', 85);
  s1.addSubject('IoT Networks', 78);
  s1.addSubject('Machine Learning', 92);
  s1.displayResult();

  var s2 = Student('Tanvir Hasan', '2201015');
  s2.addSubject('Mobile Computing', 65);
  s2.addSubject('IoT Networks', 58);
  s2.addSubject('Machine Learning', 70);
  s2.displayResult();
}
