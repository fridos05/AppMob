import 'package:flutter/material.dart';

class Timetable extends StatelessWidget {
  final List<Map<String, String>> sessions = [
    {"subject": "Maths", "teacher": "Prof. Dubois", "time": "10:00 - 11:00"},
    {"subject": "Physics", "teacher": "Prof. Martin", "time": "11:00 - 12:00"},
    {"subject": "Maths", "teacher": "Prof. Dubois", "time": "13:00 - 14:00"},
    {"subject": "Physics", "teacher": "Prof. Martin", "time": "14:00 - 15:00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timetable")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: sessions.length,
          itemBuilder: (context, index) {
            final session = sessions[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text(session['subject']!, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(session['teacher']!),
                trailing: Text(session['time']!),
              ),
            );
          },
        ),
      ),
    );
  }
}
