import 'package:easylearning/screens/login_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Model/UserModel.dart';

class Course implements Comparable<Course> {
  String name;
  String instructor;
  int duration;
  double price;
  bool isEnrolled;

  Course(this.name, this.instructor, this.duration, this.price) {
    isEnrolled = false;
  }

  @override
  int compareTo(Course other) {
    return name.compareTo(other.name);
  }
}

class Student {
  String name;
  List<Course> coursesEnrolled;

  Student(this.name) {
    coursesEnrolled = [];
  }

  void enrollCourse(Course course) {
    if (!course.isEnrolled) {
      course.isEnrolled = true;
      coursesEnrolled.add(course);
      print('Enrolled in ${course.name}');
    } else {
      print('Already enrolled in ${course.name}');
    }
  }

  void deleteCourse(Course course) {
    if (!course.isEnrolled) {
      course.isEnrolled = true;
      coursesEnrolled.add(course);
      print('Enrolled in ${course.name}');
    } else {
      print('Delete course ${course.name}');
    }
  }

  void dropCourse(Course course) {
    if (course.isEnrolled) {
      course.isEnrolled = false;
      coursesEnrolled.remove(course);
      print('Dropped ${course.name}');
    } else {
      print('Course ${course.name} not enrolled.');
    }
  }

  void displayEnrolledCourses() {
    if (coursesEnrolled.isEmpty) {
      print('No courses enrolled.');
    } else {
      coursesEnrolled.sort(); // Sort the enrolled courses

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
  student.enrollCourse(course1); // Trying to enroll in the same course again

  // Displaying enrolled courses
  student.displayEnrolledCourses();

  // Dropping a course
  student.dropCourse(course2);
  student.dropCourse(course2); // Trying to drop a course not enrolled

  // Displaying enrolled courses after dropping
  student.displayEnrolledCourses();
}