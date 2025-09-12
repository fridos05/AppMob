import 'package:flutter/material.dart';

class TeacherProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Open drawer or menu
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Avatar + Name
            Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage('assets/images/avatar.png'), // Replace with your asset
                  backgroundColor: Colors.grey[200],
                ),
                SizedBox(height: 12),
                Text("Mr. Jean-Pierre", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("Teacher", style: TextStyle(color: Colors.grey[600])),
              ],
            ),
            SizedBox(height: 32),

            // Actions
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Actions", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            SizedBox(height: 16),

            actionButton(
              icon: Icons.check_circle_outline,
              label: "Valider la séance",
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              onTap: () {},
            ),
            SizedBox(height: 12),
            actionTile(
              icon: Icons.schedule_outlined,
              label: "Reporter une séance",
              onTap: () {},
            ),
            actionTile(
              icon: Icons.calendar_today_outlined,
              label: "Voir mon emploi du temps",
              onTap: () {},
            ),

            SizedBox(height: 32),

            // Quick Access
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Quick Access", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                quickAccessCard(
                  icon: Icons.bar_chart,
                  label: "My Reports",
                  onTap: () {},
                ),
                quickAccessCard(
                  icon: Icons.person_outline,
                  label: "My Profile",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Timetable'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          // Handle navigation if needed
        },
      ),
    );
  }

  Widget actionButton({
    required IconData icon,
    required String label,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: backgroundColor == Colors.white ? Border.all(color: Colors.grey.shade300) : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: textColor),
            SizedBox(width: 12),
            Expanded(child: Text(label, style: TextStyle(color: textColor))),
            Icon(Icons.arrow_forward_ios, color: textColor, size: 16),
          ],
        ),
      ),
    );
  }

  Widget actionTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return actionButton(
      icon: icon,
      label: label,
      onTap: onTap,
    );
  }

  Widget quickAccessCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 90,
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28),
              SizedBox(height: 8),
              Text(label, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
