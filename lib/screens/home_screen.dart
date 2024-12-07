import 'package:flutter/material.dart';
import 'attendance_screen.dart';
import 'attendance_percentage_screen.dart';
import 'add_student_screen.dart';
import '../models/student.dart';

class HomeScreen extends StatelessWidget {
  final List<Student> students;

  HomeScreen({Key? key, required this.students}) : super(key: key);

  void _navigateToAttendanceScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AttendanceScreen(students: students),
      ),
    );
  }

  void _navigateToAttendancePercentageScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AttendancePercentageScreen(
          students: students,
          selectedMonth: DateTime.now(), // Current month
        ),
      ),
    );
  }

  void _navigateToAddStudentScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddStudentScreen(students: students),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Attendance Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _navigateToAddStudentScreen(context),
              child: Text('Add Student'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToAttendanceScreen(context),
              child: Text('Mark Attendance'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToAttendancePercentageScreen(context),
              child: Text('View Attendance Percentages'),
            ),
          ],
        ),
      ),
    );
  }
}
