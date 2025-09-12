import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(Icons.menu_book_outlined, size: 60),
                SizedBox(height: 20),
                Text("Bienvenue", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Connectez-vous pour continuer"),
                SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Entrez votre email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: "Entrez votre mot de passe",
                    border: OutlineInputBorder(),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password-email');
                    },
                    child: Text("Mot de passe oublié ?"),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Se connecter"),
                  style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                ),
                SizedBox(height: 10),
                Text("Vous n'avez pas de compte ? "),
                TextButton(onPressed: () {}, child: Text("S’inscrire"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
