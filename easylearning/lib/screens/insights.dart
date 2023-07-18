class Student {
  String name;
  Map<String, double> courseProgress = {};

  // Constructor to initialize the student's name and progress in each course
  Student(this.name, this.courseProgress);

  // Function to calculate the overall average progress across all courses
  double calculateOverallAverage() {
    double totalProgress = 0;
    int numberOfCourses = courseProgress.length;

    courseProgress.forEach((course, progress) {
      totalProgress += progress;
    });

    return totalProgress / numberOfCourses;
  }

  // Function to get the course with the highest progress
  String getBestCourse() {
    double highestProgress = 0;
    String bestCourse = "";

    courseProgress.forEach((course, progress) {
      if (progress > highestProgress) {
        highestProgress = progress;
        bestCourse = course;
      }
    });

    return bestCourse;
  }

  // Function to get the course with the lowest progress
  String getWorstCourse() {
    double lowestProgress = double.infinity;
    String worstCourse = "";

    courseProgress.forEach((course, progress) {
      if (progress < lowestProgress) {
        lowestProgress = progress;
        worstCourse = course;
      }
    });

    return worstCourse;
  }
}

void main() {
  // Sample data for a student's progress in different courses
  Map<String, double> progress = {
    'Biology': 85,
    'Physics': 92,
    'Chemistry': 78,
    'Mathematics': 70,
  };

  // Create a Student object with the sample data
  Student student = Student("John Doe", progress);

  // Calculate and print overall average progress
  double overallAverage = student.calculateOverallAverage();
  print('Overall Average Progress: $overallAverage');

  // Get and print the best and worst courses
  String bestCourse = student.getBestCourse();
  String worstCourse = student.getWorstCourse();
  print('Best Course: $bestCourse');
  print('Worst Course: $worstCourse');
}
