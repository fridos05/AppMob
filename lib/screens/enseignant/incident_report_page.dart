import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class IncidentReportPage extends StatefulWidget {
  @override
  _IncidentReportPageState createState() => _IncidentReportPageState();
}

class _IncidentReportPageState extends State<IncidentReportPage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedStudent;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedIncidentType;
  String description = '';
  bool needsReschedule = false;
  String remarks = '';
  File? attachedFile;

  List<String> students = ['Jean Dupont', 'Marie Curie']; // À récupérer dynamiquement
  List<String> incidentTypes = [
    'Élève absent',
    'Professeur absent',
    'Problème technique',
    'Comportement',
    'Autre'
  ];
  
  get DatePicker => null;

  Future<void> _pickDate() async {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      onConfirm: (date) {
        setState(() => selectedDate = date);
      },
      currentTime: DateTime.now(),
    );
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() => selectedTime = time);
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        attachedFile = File(result.files.single.path!);
      });
    }



      }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {
      _formKey.currentState!.save();

      DateTime fullDateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );

      // ⚠️ Remplace Firebase par simple affichage dans la console
      print('--- Incident Report ---');
      print('Élève : $selectedStudent');
      print('Type : $selectedIncidentType');
      print('Description : $description');
      print('Date et heure : $fullDateTime');
      print('Reprogrammation : $needsReschedule');
      print('Remarques : $remarks');
      print('Fichier joint : ${attachedFile?.path ?? "Aucun"}');
      print('------------------------');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signalement (hors ligne) enregistré')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signalement d’un incident')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Élève
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Élève concerné'),
                value: selectedStudent,
                items: students.map((student) {
                  return DropdownMenuItem(
                      value: student, child: Text(student));
                }).toList(),
                onChanged: (value) => setState(() => selectedStudent = value),
                validator: (value) =>
                    value == null ? 'Veuillez sélectionner un élève' : null,
              ),

              // Date
              ListTile(
                title: Text(selectedDate == null
                    ? 'Date du cours'
                    : 'Date : ${selectedDate!.toLocal().toString().split(' ')[0]}'),
                trailing: Icon(Icons.calendar_today),
                onTap: _pickDate,
              ),

              // Heure
              ListTile(
                title: Text(selectedTime == null
                    ? 'Heure du cours'
                    : 'Heure : ${selectedTime!.format(context)}'),
                trailing: Icon(Icons.access_time),
                onTap: _pickTime,
              ),

              // Type d'incident
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Type d’incident'),
                value: selectedIncidentType,
                items: incidentTypes.map((type) {
                  return DropdownMenuItem(value: type, child: Text(type));
                }).toList(),
                onChanged: (value) =>
                    setState(() => selectedIncidentType = value),
                validator: (value) =>
                    value == null ? 'Sélectionner un type' : null,
              ),

              // Description
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                onSaved: (value) => description = value ?? '',
                validator: (value) =>
                    value!.isEmpty ? 'Décrire l’incident' : null,
              ),

              // Fichier joint
              TextButton.icon(
                onPressed: _pickFile,
                icon: Icon(Icons.attach_file),
                label: Text(attachedFile != null
                    ? 'Fichier sélectionné'
                    : 'Joindre un fichier'),
              ),

              // Reprogrammation
              SwitchListTile(
                title: Text('Nécessite une reprogrammation ?'),
                value: needsReschedule,
                onChanged: (value) =>
                    setState(() => needsReschedule = value),
              ),

              // Remarques pour le parent
              TextFormField(
                decoration: InputDecoration(labelText: 'Remarques pour le parent'),
                maxLines: 2,
                onSaved: (value) => remarks = value ?? '',
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Envoyer le signalement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


