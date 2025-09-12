import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courses = [
    {
      "title": "Introduction to Programming",
      "prof": "Prof. Anya Sharma",
      "progress": 0.7,
      "image": "assets/images/programming.png"
    },
    {
      "title": "Calculus I",
      "prof": "Prof. Ethan Carter",
      "progress": 0.3,
      "image": "assets/images/calculus.png"
    },
    {
      "title": "Linear Algebra",
      "prof": "Prof. Olivia Bennett",
      "progress": 0.5,
      "image": "assets/images/algebra.png"
    },
    {
      "title": "Discrete Mathematics",
      "prof": "Prof. Noah Thompson",
      "progress": 1.0,
      "image": "assets/images/math.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: Image.asset(course['image'], width: 50),
              title: Text(course['title'], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course['prof']),
                  SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: course['progress'],
                    color: Colors.blue,
                    backgroundColor: Colors.grey[200],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
