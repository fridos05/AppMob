import 'package:flutter/material.dart';
import 'package:repetition_tracker/witness/CreateWitnessPage.dart';
// à créer
// à créer

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Témoin App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue,
          ),
        ),
      ),
      home: CreateWitnessPage(), // Point d'entrée : page de login
    );
  }
}
