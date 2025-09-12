import 'package:flutter/material.dart';
import 'enseignant_screen.dart';

class Loginens extends StatefulWidget {
  @override
  _LoginensState createState() => _LoginensState();
}

class _LoginensState extends State<Loginens> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? errorMessage;

  void _login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    setState(() {
      errorMessage = null;
    });

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = "Veuillez remplir tous les champs";
      });
      return;
    }

    // Ici tu peux faire ta logique d'authentification réelle

    // Si tout va bien, navigue vers la page enseignant
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TeacherProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(Icons.menu_book_outlined, size: 60, color: Colors.indigo.shade700),
                SizedBox(height: 20),
                Text(
                  "Bienvenue",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade900,
                  ),
                ),
                Text(
                  "Connectez-vous pour continuer",
                  style: TextStyle(color: Colors.indigo.shade700),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.indigo.shade700),
                    hintText: "Entrez votre email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.indigo.shade700),
                    hintText: "Entrez votre mot de passe",
                    border: OutlineInputBorder(),
                  ),
                ),
                if (errorMessage != null) ...[
                  SizedBox(height: 10),
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password-email');
                    },
                    child: Text(
                      "Mot de passe oublié ?",
                      style: TextStyle(color: const Color.fromARGB(255, 62, 117, 237)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _login,
                  child: Text("Se connecter"),
                ),
                SizedBox(height: 10),
                Text("Vous n'avez pas de compte ? ", style: TextStyle(color: Colors.indigo.shade700)),
                TextButton(
                  onPressed: () {
                    // TODO: page inscription à créer
                  },
                  child: Text("S’inscrire", style: TextStyle(color: Colors.indigo.shade900)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
