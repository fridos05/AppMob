import 'package:flutter/material.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Plateforme de gestion des cours de répétition',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Choisissez une option pour continuer.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Tu peux ajouter ici d'autres widgets utiles pour le parent
          ],
        ),
      ),
    );
  }
}
