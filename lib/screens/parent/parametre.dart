import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool emailAlerts = true;
  bool pushNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Account Management
          Text("Account Management", style: sectionHeaderStyle),
          ListTile(
            title: Text("Update Profile"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text("Change Password"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          SizedBox(height: 16),

          // Notifications
          Text("Notifications", style: sectionHeaderStyle),
          SwitchListTile(
            title: Text("Email Alerts"),
            subtitle: Text("Receive email alerts for session validations"),
            value: emailAlerts,
            onChanged: (val) {
              setState(() {
                emailAlerts = val;
              });
            },
          ),
          SwitchListTile(
            title: Text("Push Notifications"),
            subtitle: Text("Get push notifications for important updates"),
            value: pushNotifications,
            onChanged: (val) {
              setState(() {
                pushNotifications = val;
              });
            },
          ),
          SizedBox(height: 16),

          // Privacy
          Text("Privacy", style: sectionHeaderStyle),
          ListTile(
            title: Text("Privacy Policy"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text("Terms of Service"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          SizedBox(height: 16),

          // Help & Support
          Text("Help & Support", style: sectionHeaderStyle),
          ListTile(
            title: Text("FAQs"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text("Contact Us"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  final sectionHeaderStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.grey[700],
  );
}
