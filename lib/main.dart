import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'models/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Initialize students list
  List<Student> initializeStudents() {
    return [
      Student(
        id: '1',
        name: 'a',
        rollNo: '01',
        sec: 'A',
        attendance: {},
      ),
      Student(
        id: '2',
        name: 'b',
        rollNo: '02',
        sec: 'A',
        attendance: {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Attendance Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(students: initializeStudents()),
    );
  }
}
