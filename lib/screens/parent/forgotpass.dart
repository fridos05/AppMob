import 'package:flutter/material.dart';

class ForgotPasswordEmailScreen extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(""),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Icon(Icons.lock_open, size: 60, color: Colors.indigo.shade700),
            SizedBox(height: 16),
            Text(
              "Mot de passe oublié?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo.shade900),
            ),
            SizedBox(height: 8),
            Text(
              "Entrez l’adresse e-mail associée à votre compte et nous vous enverrons un lien pour réinitialiser votre mot de passe.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo.shade700),
            ),
            SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Adresse e-mail",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/reset-password');
              },
              child: Text("Réinitialiser le mot de passe"),
            ),
          ],
        ),
      ),
    );
  }
}
