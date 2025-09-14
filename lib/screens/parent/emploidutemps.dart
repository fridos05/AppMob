import 'package:flutter/material.dart';
import 'package:repetition_tracker/screens/parent/newsession.dart';

class TimetableScreen extends StatelessWidget {
  final List<Map<String, String>> sessions = [
    {
      "time": "9:00 AM - 10:00 AM",
      "subject": "Math 101",
      "student": "Olivia",
      "date": "today",
    },
    {
      "time": "11:00 AM - 12:00 PM",
      "subject": "Science 202",
      "student": "Liam",
      "date": "tomorrow",
    },
    {
      "time": "1:00 PM - 2:00 PM",
      "subject": "History 301",
      "student": "Emma",
      "date": "tomorrow",
    },
    {
      "time": "3:00 PM - 4:00 PM",
      "subject": "English 401",
      "student": "Noah",
      "date": "2025-10-16", // Example date
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emploi de temps"),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search and Filter
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search session",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list),
                  label: Text("Matière"),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Session List
            Expanded(
              child: ListView(
                children: [
                  sessionSection("Today", sessions.where((s) => s['date'] == 'today').toList()),
                  sessionSection("Tomorrow", sessions.where((s) => s['date'] == 'tomorrow').toList()),
                  sessionSection("Wednesday, October 16", sessions.where((s) => s['date'] == '2025-10-16').toList()),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => NewSessionScreen()));
        },
        icon: Icon(Icons.add),
        label: Text(""),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Timetable'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Sessions'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Students'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget sessionSection(String title, List<Map<String, String>> items) {
    if (items.isEmpty) return SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 8),
        ...items.map((session) => sessionCard(session)).toList(),
        SizedBox(height: 16),
      ],
    );
  }

  Widget sessionCard(Map<String, String> session) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(child: Text(session['student']![0])),
        title: Text("${session['subject']} with ${session['student']}"),
        subtitle: Text(session['time']!),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
