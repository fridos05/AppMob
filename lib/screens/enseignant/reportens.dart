import 'package:flutter/material.dart';

class TeacherReportsScreen extends StatelessWidget {
  final double teachingHours = 120;
  final int sessionsCompleted = 45;
  final double averageRating = 4.8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reports"),
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
            Text("Overall Performance", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            SizedBox(height: 16),
            performanceCard("Teaching Hours", "$teachingHours", "+10%", Colors.green),
            performanceCard("Sessions Completed", "$sessionsCompleted", "+5%", Colors.green),
            performanceCard("Average Rating", "$averageRating", "-2%", Colors.red),

            SizedBox(height: 24),
            Text("Filter Reports", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: filterChip("Date Range", () {})),
                SizedBox(width: 8),
                Expanded(child: filterChip("Student", () {})),
                SizedBox(width: 8),
                Expanded(child: filterChip("Subject", () {})),
              ],
            ),

            SizedBox(height: 24),
            Text("Session Reports", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            sessionCard("Session 1", "Math", "Completed"),
            sessionCard("Session 2", "Physics", "Completed"),
            sessionCard("Session 3", "Chemistry", "Completed"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Timetable'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget performanceCard(String title, String value, String change, Color changeColor) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Text(
                  change,
                  style: TextStyle(color: changeColor, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget filterChip(String label, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        shape: StadiumBorder(),
        side: BorderSide(color: Colors.grey.shade300),
        backgroundColor: Colors.grey.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Widget sessionCard(String title, String subject, String status) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subject),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(status, style: TextStyle(color: Colors.green[800])),
        ),
      ),
    );
  }
}
