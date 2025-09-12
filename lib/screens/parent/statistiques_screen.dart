import 'package:flutter/material.dart';

class StatistiquesScreen extends StatelessWidget {
  const StatistiquesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistiques"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: "Séances"),
          BottomNavigationBarItem(icon: Icon(Icons.insert_drive_file), label: "Rapports"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Statistiques"),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Résumé des séances", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildStatCard("Séances totales", "125"),
                const SizedBox(width: 12),
                _buildStatCard("Heures totales", "187,5"),
              ],
            ),
            const SizedBox(height: 12),
            _buildStatCard("Moyenne par séance", "1,5h", isFullWidth: true),
            const SizedBox(height: 24),
            const Text("Performance des élèves", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildSubjectProgress("Mathématiques", 0.9, Colors.blue),
            _buildSubjectProgress("Physique", 0.6, Colors.cyan),
            _buildSubjectProgress("Chimie", 0.4, Colors.amber),
            _buildSubjectProgress("Biologie", 0.95, Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, {bool isFullWidth = false}) {
    return Expanded(
      flex: isFullWidth ? 2 : 1,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectProgress(String subject, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subject, style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: value,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
            color: color,
            backgroundColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
