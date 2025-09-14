import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tableau de Bord Parent',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ParentDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ParentDashboard extends StatelessWidget {
  const ParentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de Bord Parent'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Administration
            _buildSectionTitle('Administration'),
            _buildNotificationItem('Il y a 2 jours'),
            const SizedBox(height: 24),
            
            // Section Actions Rapides
            _buildSectionTitle('Actions Rapides'),
            const SizedBox(height: 16),
            
            // Première ligne d'actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(
                  context,
                  'Créer un enseignant',
                  Icons.person_add,
                  Colors.blue,
                  const CreateTeacherPage(),
                ),
                _buildActionButton(
                  context,
                  'Créer un élève',
                  Icons.child_care,
                  Colors.green,
                  const CreateStudentPage(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Deuxième ligne d'actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(
                  context,
                  'Créer un témoin',
                  Icons.record_voice_over,
                  Colors.orange,
                  const CreateWitnessPage(),
                ),
                _buildActionButton(
                  context,
                  'Voir les rapports',
                  Icons.assignment,
                  Colors.purple,
                  const ViewReportsPage(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Troisième ligne d'actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(
                  context,
                  'Voir les statistiques',
                  Icons.bar_chart,
                  Colors.red,
                  const ViewStatisticsPage(),
                ),
                _buildActionButton(
                  context,
                  'Valider une séance',
                  Icons.check_circle,
                  Colors.teal,
                  const ValidateSessionPage(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Section Menu
            _buildSectionTitle('Menu'),
            const SizedBox(height: 16),
            
            _buildMenuOption(context, 'Dashboard', Icons.dashboard, const ParentDashboard()),
            _buildMenuOption(context, 'Reports', Icons.assignment, const ViewReportsPage()),
            _buildMenuOption(context, 'Settings', Icons.settings, const SettingsPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildNotificationItem(String time) {
    return Row(
      children: [
        const Icon(Icons.notifications, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Text(
          time,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, String title, IconData icon, Color color, Widget page) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton.icon(
          icon: Icon(icon, color: Colors.white),
          label: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuOption(BuildContext context, String title, IconData icon, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

// Pages des différentes actions (à compléter selon vos besoins)

class CreateTeacherPage extends StatelessWidget {
  const CreateTeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un enseignant'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text('Page de création d\'enseignant'),
      ),
    );
  }
}

class CreateStudentPage extends StatelessWidget {
  const CreateStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un élève'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text('Page de création d\'élève'),
      ),
    );
  }
}

class CreateWitnessPage extends StatelessWidget {
  const CreateWitnessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un témoin'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text('Page de création de témoin'),
      ),
    );
  }
}

class ViewReportsPage extends StatelessWidget {
  const ViewReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voir les rapports'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text('Page des rapports'),
      ),
    );
  }
}

class ViewStatisticsPage extends StatelessWidget {
  const ViewStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voir les statistiques'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text('Page des statistiques'),
      ),
    );
  }
}

class ValidateSessionPage extends StatelessWidget {
  const ValidateSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valider une séance'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text('Page de validation de séance'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text('Page des paramètres'),
      ),
    );
  }
}