import 'package:flutter/material.dart';

class PresenceConfirmationScreen extends StatefulWidget {
  const PresenceConfirmationScreen({super.key});

  @override
  State<PresenceConfirmationScreen> createState() =>
      _PresenceConfirmationScreenState();
}

class _PresenceConfirmationScreenState
    extends State<PresenceConfirmationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tuteurController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _confirmPresence() {
    if (_formKey.currentState!.validate() &&
        _selectedDate != null &&
        _selectedTime != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Présence confirmée avec succès")),
      );
      // Reset form
      _formKey.currentState!.reset();
      _tuteurController.clear();
      setState(() {
        _selectedDate = null;
        _selectedTime = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmer la présence"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: _confirmPresence,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            "Confirmer la présence",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Nom du tuteur"),
              const SizedBox(height: 8),
              TextFormField(
                controller: _tuteurController,
                decoration: const InputDecoration(
                  hintText: "Ex: Jean Dupont",
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 20),
              const Text("Date de la séance"),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: _selectedDate == null
                          ? 'mm/dd/yyyy'
                          : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (_) =>
                        _selectedDate == null ? 'Date requise' : null,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Heure de la séance"),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickTime,
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: _selectedTime == null
                          ? '--:-- --'
                          : _selectedTime!.format(context),
                      prefixIcon: const Icon(Icons.access_time),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (_) =>
                        _selectedTime == null ? 'Heure requise' : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
