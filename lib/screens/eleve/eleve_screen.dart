import 'package:flutter/material.dart';

class StudentProfileScreen extends StatelessWidget {
  final String studentName = "Ethan Carter";
  final String studentId = "123456";

  final List<Map<String, String>> upcomingSchedule = [
    {"time": "8:00 AM - 9:00 AM", "subject": "Math 101"},
    {"time": "10:00 AM - 11:00 AM", "subject": "Physics 202"},
    {"time": "1:00 PM - 2:00 PM", "subject": "Chemistry 303"},
  ];

  final List<Map<String, String>> completedSessions = [
    {"time": "9:00 AM - 10:00 AM", "subject": "History 404"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Avatar + Name
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/avatar.png"), // Replace with your image
                ),
                SizedBox(height: 12),
                Text(studentName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Student ID: $studentId", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to timetable
                  },
                  child: Text("Voir emploi du temps"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            // Upcoming Schedule
            Text("Upcoming Schedule", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 12),
            ...upcomingSchedule.map((item) => scheduleCard(item, isCompleted: false)).toList(),

            SizedBox(height: 20),

            // Recently Completed
            Text("Recently Completed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 12),
            ...completedSessions.map((item) => scheduleCard(item, isCompleted: true)).toList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Timetable"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget scheduleCard(Map<String, String> session, {bool isCompleted = false}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isCompleted ? Colors.grey[300] : Colors.blue[50],
          child: Icon(
            isCompleted ? Icons.check_circle : Icons.access_time,
            color: isCompleted ? Colors.grey : Colors.blue,
          ),
        ),
        title: Text(session['time'] ?? ""),
        subtitle: Text(session['subject'] ?? ""),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          // Action when session is tapped
        },
      ),
    );
  }
}
