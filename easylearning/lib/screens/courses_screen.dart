class Course {
  String name;
  String instructor;
  int duration;
  double price;

  Course(this.name, this.instructor, this.duration, this.price);
}

class Student {
  String name;
  List<Course> coursesEnrolled;

  Student(this.name) {
    coursesEnrolled = [];
  }

  void enrollCourse(Course course) {
    coursesEnrolled.add(course);
    print('Enrolled in ${course.name}');
  }

  void displayEnrolledCourses() {
    if (coursesEnrolled.isEmpty) {
      print('No courses enrolled.');
    } else {
      print('Enrolled Courses:');
      for (var course in coursesEnrolled) {
        print('- ${course.name} (Instructor: ${course.instructor})');
      }
    }
  }
}

void main() {
  // Creating sample courses
  Course course1 = Course('Mathematics', 'John Doe', 10, 99.99);
  Course course2 = Course('English Literature', 'Jane Smith', 8, 79.99);
  Course course3 = Course('Computer Science', 'Michael Johnson', 12, 149.99);

  // Creating a student
  Student student = Student('Alice');

  // Enrolling courses for the student
  student.enrollCourse(course1);
  student.enrollCourse(course2);
  student.enrollCourse(course3);

  // Displaying enrolled courses
  student.displayEnrolledCourses();
}
