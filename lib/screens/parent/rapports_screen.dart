import 'package:flutter/material.dart';

class RapportsScreen extends StatelessWidget {
  const RapportsScreen({super.key});

  // Données simulées
  final List<Map<String, String>> rapports = const [
    {
      'titre': 'Séance du 5 septembre',
      'date': '05/09/2025',
      'contenu': 'L’élève a bien participé à la séance. Amélioration en lecture.'
    },
    {
      'titre': 'Séance du 2 septembre',
      'date': '02/09/2025',
      'contenu': 'Travail sur les opérations de base. A montré des difficultés en division.'
    },
    {
      'titre': 'Séance du 30 août',
      'date': '30/08/2025',
      'contenu': 'Séance annulée à cause de l’absence de l’élève.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rapports des séances")),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: rapports.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final rapport = rapports[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: ListTile(
              title: Text(
                rapport['titre'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${rapport['date']}\n${rapport['contenu']}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Optional: show dialog with full details
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(rapport['titre'] ?? ''),
                    content: Text(rapport['contenu'] ?? ''),
                    actions: [
                      TextButton(
                        child: const Text("Fermer"),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
