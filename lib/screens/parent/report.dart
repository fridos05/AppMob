import 'package:flutter/material.dart';

class ParentReportsPage extends StatefulWidget {
  @override
  _ParentReportsPageState createState() => _ParentReportsPageState();
}

class _ParentReportsPageState extends State<ParentReportsPage> {
  String selectedStudent = "Student";
  String selectedTeacher = "Teacher";
  String selectedDateRange = "Date Range";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parent Reports"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filters", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            // Filters Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                filterDropdown(selectedStudent, (value) {
                  setState(() => selectedStudent = value ?? selectedStudent);
                }),
                filterDropdown(selectedTeacher, (value) {
                  setState(() => selectedTeacher = value ?? selectedTeacher);
                }),
                filterDropdown(selectedDateRange, (value) {
                  setState(() => selectedDateRange = value ?? selectedDateRange);
                }),
              ],
            ),

            SizedBox(height: 20),

            // Student Progress Card
            reportCard(
              title: "Student Progress",
              subtitle: "Overall Score",
              value: "85%",
              change: "+5%",
              changeColor: Colors.green,
              icon: Icons.arrow_upward,
            ),

            SizedBox(height: 16),

            // Teacher Hours Card
            reportCard(
              title: "Teacher Hours",
              subtitle: "Total Hours",
              value: "120h",
              change: "+10%",
              changeColor: Colors.green,
              icon: Icons.arrow_upward,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget filterDropdown(String label, ValueChanged<String?>? onChanged) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        value: label,
        items: [label].map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget reportCard({
    required String title,
    required String subtitle,
    required String value,
    required String change,
    required Color changeColor,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Icon(icon, color: changeColor, size: 16),
                    Text(change, style: TextStyle(color: changeColor)),
                  ],
                ),
                SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 8),
                Text(value, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
