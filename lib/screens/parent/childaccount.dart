import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des Élèves',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const StudentManagementPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StudentManagementPage extends StatefulWidget {
  const StudentManagementPage({super.key});

  @override
  _StudentManagementPageState createState() => _StudentManagementPageState();
}

class _StudentManagementPageState extends State<StudentManagementPage> {
  final List<Student> _students = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _classController = TextEditingController();

  // Emploi du temps exemple
  final List<ScheduleItem> _schedule = [
    ScheduleItem(day: 'Lundi', time: '08:00-09:00', subject: 'Mathématiques'),
    ScheduleItem(day: 'Lundi', time: '09:00-10:00', subject: 'Français'),
    ScheduleItem(day: 'Lundi', time: '10:30-11:30', subject: 'Histoire'),
    ScheduleItem(day: 'Lundi', time: '13:30-14:30', subject: 'Sciences'),
    ScheduleItem(day: 'Lundi', time: '14:30-15:30', subject: 'Sport'),
    ScheduleItem(day: 'Mardi', time: '08:00-09:00', subject: 'Anglais'),
    ScheduleItem(day: 'Mardi', time: '09:00-10:00', subject: 'Géographie'),
    ScheduleItem(day: 'Mardi', time: '10:30-11:30', subject: 'Mathématiques'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des Élèves'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Section d'ajout d'élève
          _buildAddStudentSection(),
          
          // Liste des élèves
          Expanded(
            child: _students.isEmpty
                ? const Center(
                    child: Text(
                      'Aucun élève ajouté',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _students.length,
                    itemBuilder: (context, index) {
                      return _buildStudentCard(_students[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddStudentSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ajouter un nouvel élève',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nom de l\'élève',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _classController,
            decoration: const InputDecoration(
              labelText: 'Classe',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.school),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: _addStudent,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text('Ajouter l\'élève'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentCard(Student student) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          _showStudentSchedule(student);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                student.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Classe: ${student.className}',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 8),
              const Text(
                'Cliquez pour voir l\'emploi du temps →',
                style: TextStyle(fontSize: 14, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addStudent() {
    final String name = _nameController.text.trim();
    final String className = _classController.text.trim();

    if (name.isEmpty || className.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir tous les champs'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _students.add(Student(name: name, className: className));
      _nameController.clear();
      _classController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name a été ajouté avec succès'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showStudentSchedule(Student student) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Emploi du temps - ${student.name}'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Classe: ${student.className}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: _buildScheduleList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildScheduleList() {
    // Grouper par jour
    final Map<String, List<ScheduleItem>> scheduleByDay = {};
    for (var item in _schedule) {
      if (!scheduleByDay.containsKey(item.day)) {
        scheduleByDay[item.day] = [];
      }
      scheduleByDay[item.day]!.add(item);
    }

    return ListView(
      children: [
        for (var day in scheduleByDay.keys)
          _buildDaySchedule(day, scheduleByDay[day]!),
      ],
    );
  }

  Widget _buildDaySchedule(String day, List<ScheduleItem> items) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 12),
            ...items.map((item) => _buildScheduleItem(item)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleItem(ScheduleItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              item.time,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              item.subject,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _classController.dispose();
    super.dispose();
  }
}

class Student {
  final String name;
  final String className;

  Student({required this.name, required this.className});
}

class ScheduleItem {
  final String day;
  final String time;
  final String subject;

  ScheduleItem({required this.day, required this.time, required this.subject});
}