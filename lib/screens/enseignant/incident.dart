class Incident {
  final String student;
  final DateTime dateTime;
  final String incidentType;
  final String description;
  final bool needsReschedule;
  final String remarks;

  Incident({
    required this.student,
    required this.dateTime,
    required this.incidentType,
    required this.description,
    required this.needsReschedule,
    required this.remarks,
  });
}
