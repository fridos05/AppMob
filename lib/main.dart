import 'package:flutter/material.dart';
import 'package:repetition_tracker/witness/WitnessProfilePage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des cours',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  ProfilePage(),
    );
  }
  
}

// Removed unused _ParentReportsPageState class


