import 'package:flutter/material.dart';

class Incident {
  final String student;
  final String type;
  final String description;
  final DateTime dateTime;
  final bool needsReschedule;
  final String remarks;
  final String? attachedFile;

  Incident({
    required this.student,
    required this.type,
    required this.description,
    required this.dateTime,
    required this.needsReschedule,
    required this.remarks,
    this.attachedFile,
  });
}

class IncidentListPage extends StatefulWidget {
  const IncidentListPage({Key? key}) : super(key: key);

  @override
  State<IncidentListPage> createState() => _IncidentListPageState();
}

class _IncidentListPageState extends State<IncidentListPage> {
  // Simule une liste d'incidents
  List<Incident> incidents = [
    Incident(
      student: 'Jean Dupont',
      type: 'Élève absent',
      description: 'Jean était absent pour raison médicale.',
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
      needsReschedule: true,
      remarks: 'Merci de prévenir à l\'avance.',
      attachedFile: null,
    ),
    Incident(
      student: 'Marie Curie',
      type: 'Problème technique',
      description: 'Problème de connexion internet.',
      dateTime: DateTime.now().subtract(const Duration(days: 2)),
      needsReschedule: false,
      remarks: '',
      attachedFile: null,
    ),
  ];

  void _requestReschedule(int index) {
    setState(() {
      incidents[index] = Incident(
        student: incidents[index].student,
        type: incidents[index].type,
        description: incidents[index].description,
        dateTime: incidents[index].dateTime,
        needsReschedule: true,
        remarks: incidents[index].remarks,
        attachedFile: incidents[index].attachedFile,
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Demande de reprogrammation envoyée')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Incidents signalés')),
      body: ListView.builder(
        itemCount: incidents.length,
        itemBuilder: (context, index) {
          final incident = incidents[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(Icons.report, color: Colors.redAccent),
              title: Text('${incident.type} (${incident.student})'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date : ${incident.dateTime.toLocal().toString().split(' ')[0]}'),
                  Text('Description : ${incident.description}'),
                  if (incident.remarks.isNotEmpty)
                    Text('Remarques : ${incident.remarks}'),
                  if (incident.attachedFile != null)
                    Text('Fichier joint : ${incident.attachedFile}'),
                  const SizedBox(height: 8),
                  incident.needsReschedule
                      ? const Text(
                          'Reprogrammation demandée',
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                        )
                      : ElevatedButton.icon(
                          onPressed: () => _requestReschedule(index),
                          icon: const Icon(Icons.schedule),
                          label: const Text('Demander une reprogrammation'),
                        ),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}