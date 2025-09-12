import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hasMinLength = false;
  bool hasUpperLower = false;
  bool hasNumberSymbol = false;

  void validatePassword(String password) {
    setState(() {
      hasMinLength = password.length >= 8;
      hasUpperLower = RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(password);
      hasNumberSymbol = RegExp(r'(?=.*\d)(?=.*[!@#\$&*~])').hasMatch(password);
    });
  }

  Widget buildRequirement(String text, bool met) {
    return Row(
      children: [
        Icon(met ? Icons.check_circle : Icons.cancel, color: met ? Colors.green : Colors.grey, size: 18),
        SizedBox(width: 8),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.indigo.shade700;

    return Scaffold(
      appBar: AppBar(
        title: Text("Mot de passe oublié", style: TextStyle(color: primaryColor)),
        leading: BackButton(color: primaryColor),
        backgroundColor: Colors.indigo.shade50,
        elevation: 0,
      ),
      backgroundColor: Colors.indigo.shade50,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Définir un nouveau mot de passe",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryColor),
              ),
              SizedBox(height: 24),
              TextField(
                controller: passwordController,
                obscureText: true,
                onChanged: validatePassword,
                decoration: InputDecoration(
                  hintText: "Nouveau mot de passe",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirmer le mot de passe",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Votre mot de passe doit contenir:",
                style: TextStyle(color: primaryColor),
              ),
              SizedBox(height: 8),
              buildRequirement("Au moins 8 caractères", hasMinLength),
              buildRequirement("Une majuscule et une minuscule", hasUpperLower),
              buildRequirement("Un chiffre et un symbole", hasNumberSymbol),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // TODO: Valider et changer le mot de passe
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Changer le mot de passe", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
