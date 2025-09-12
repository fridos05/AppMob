import 'package:flutter/material.dart';

class ParentDashboardPage extends StatelessWidget {
  const ParentDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Parent Dashboard'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            const Text(
              'Bonjour [Parent\'s Name]!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Bienvenue sur votre tableau de bord.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Recent Activities Section
            const Text(
              'Activités récentes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildActivityCard(Icons.check_circle, "Nouvelle séance validée", "Aujourd'hui à 14:30", Colors.green),
            _buildActivityCard(Icons.schedule, "Enseignant S. Dupont a reporté une séance", "Hier à 18:30", Colors.orange),
            _buildActivityCard(Icons.message, "Nouveau message de l'administration", "Il y a 2 jours", Colors.blue),

            const SizedBox(height: 24),

            // Quick Actions Section
            const Text(
              'Actions Rapides',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildActionTile(Icons.person_add, 'Créer un enseignant'),
                _buildActionTile(Icons.person, 'Créer un élève'),
                _buildActionTile(Icons.group, 'Créer un témoin'),
                _buildActionTile(Icons.receipt_long, 'Voir les rapports'),
                _buildActionTile(Icons.bar_chart, 'Voir les statistiques'),
                _buildActionTile(Icons.calendar_today, 'Valider une séance'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.insert_drive_file), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildActivityCard(IconData icon, String title, String time, Color iconColor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title),
        subtitle: Text(time),
      ),
    );
  }

  Widget _buildActionTile(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // Handle action tap here
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.blue),
            const SizedBox(height: 10),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
