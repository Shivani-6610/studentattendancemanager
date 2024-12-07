import 'package:flutter/material.dart';
import '../models/student.dart';

class AttendanceScreen extends StatefulWidget {
  final List<Student> students;

  AttendanceScreen({Key? key, required this.students}) : super(key: key);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime _selectedDate = DateTime.now(); // Current date

  // Method to toggle attendance for a student on a particular date
  void _toggleAttendance(int studentIndex) {
    setState(() {
      final student = widget.students[studentIndex];
      // Toggle attendance for the selected date
      student.attendance[_selectedDate] = !(student.attendance[_selectedDate] ?? false);
    });
  }

  // Pick a date from the calendar to mark attendance
  void _pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mark Attendance'),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _pickDate(context), // Open date picker
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Roll No')),
            DataColumn(label: Text('Section')),
            DataColumn(label: Text('Present')),
          ],
          rows: List.generate(widget.students.length, (index) {
            final student = widget.students[index];
            final isPresent = student.attendance[_selectedDate] ?? false;

            return DataRow(cells: [
              DataCell(Text(student.name)),
              DataCell(Text(student.rollNo)),
              DataCell(Text(student.sec)),
              DataCell(Switch(
                value: isPresent,
                onChanged: (value) => _toggleAttendance(index), // Toggle attendance
              )),
            ]);
          }),
        ),
      ),
    );
  }
}
