import 'package:flutter/material.dart';

class NewSessionScreen extends StatefulWidget {
  @override
  _NewSessionScreenState createState() => _NewSessionScreenState();
}

class _NewSessionScreenState extends State<NewSessionScreen> {
  String? selectedStudent;
  final subjectController = TextEditingController();
  final locationController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  final List<String> students = ["Olivia", "Liam", "Emma", "Noah"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle séance"),
        leading: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Dropdown Student
              DropdownButtonFormField<String>(
                value: selectedStudent,
                decoration: InputDecoration(
                  labelText: "Nom de l'étudiant",
                  border: OutlineInputBorder(),
                ),
                hint: Text("Sélectionner un étudiant"),
                items: students.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                onChanged: (val) => setState(() => selectedStudent = val),
              ),
              SizedBox(height: 16),

              // Subject
              TextField(
                controller: subjectController,
                decoration: InputDecoration(
                  labelText: "Matière",
                  hintText: "Ex: Mathématiques",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Date picker
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Date",
                  hintText: "mm/dd/yyyy",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    setState(() => selectedDate = picked);
                  }
                },
              ),
              SizedBox(height: 16),

              // Time pickers
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Heure de début",
                        hintText: "--:-- --",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.access_time),
                      ),
                      onTap: () async {
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picked != null) {
                          setState(() => startTime = picked);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Heure de fin",
                        hintText: "--:-- --",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.access_time),
                      ),
                      onTap: () async {
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picked != null) {
                          setState(() => endTime = picked);
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Location
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: "Lieu",
                  hintText: "Ex: En ligne, 123 Rue de Paris",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  // Submit session logic here
                },
                child: Text("Créer la séance"),
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
