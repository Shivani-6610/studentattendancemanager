import 'package:flutter/material.dart';
import '../models/student.dart';

class AttendancePercentageScreen extends StatelessWidget {
  final List<Student> students;
  final DateTime selectedMonth;

  AttendancePercentageScreen({Key? key, required this.students, required this.selectedMonth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Percentage'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          final percentage = student.getAttendancePercentageForMonth(selectedMonth);
          return ListTile(
            title: Text(student.name),
            subtitle: Text('Attendance: ${percentage.toStringAsFixed(2)}%'),
          );
        },
      ),
    );
  }
}
