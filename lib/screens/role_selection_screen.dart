import 'package:flutter/material.dart';

class PresenceScreen extends StatefulWidget {
  const PresenceScreen({super.key});

  @override
  State<PresenceScreen> createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController teacherController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> _pickTime({required bool isStart}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 14, minute: 0),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  void _confirmPresence() {
    if (_formKey.currentState!.validate() &&
        selectedDate != null &&
        startTime != null &&
        endTime != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Présence confirmée avec succès")),
      );

      _formKey.currentState!.reset();
      teacherController.clear();
      setState(() {
        selectedDate = null;
        startTime = null;
        endTime = null;
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Sélectionner une date';
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return 'Choisir une heure';
    return time.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirmer la présence")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: teacherController,
                decoration: const InputDecoration(
                  labelText: "Nom de l'enseignant",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _pickDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Date de la séance",
                      hintText: _formatDate(selectedDate),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (_) =>
                        selectedDate == null ? 'Date requise' : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _pickTime(isStart: true),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Heure de début",
                            hintText: _formatTime(startTime),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (_) =>
                              startTime == null ? 'Heure requise' : null,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _pickTime(isStart: false),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Heure de fin",
                            hintText: _formatTime(endTime),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (_) =>
                              endTime == null ? 'Heure requise' : null,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _confirmPresence,
                child: const Text("Confirmer la présence"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
