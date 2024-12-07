import 'package:flutter/material.dart';
import '../models/student.dart';

class AddStudentScreen extends StatefulWidget {
  final List<Student> students;

  AddStudentScreen({Key? key, required this.students}) : super(key: key);

  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _nameController = TextEditingController();
  final _rollNoController = TextEditingController();
  final _secController = TextEditingController();

  void _addStudent() {
    final name = _nameController.text.trim();
    final rollNo = _rollNoController.text.trim();
    final sec = _secController.text.trim();

    if (name.isNotEmpty && rollNo.isNotEmpty && sec.isNotEmpty) {
      final newStudent = Student(
        id: DateTime.now().toString(),
        name: name,
        rollNo: rollNo,
        sec: sec,
        attendance: {},
      );

      setState(() {
        widget.students.add(newStudent);
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _rollNoController,
              decoration: InputDecoration(labelText: 'Roll No'),
            ),
            TextField(
              controller: _secController,
              decoration: InputDecoration(labelText: 'Section'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addStudent,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
