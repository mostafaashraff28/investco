import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationsEnabled = true; // Initial state for notifications
  bool isDarkTheme = false; // Initial state for theme settings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Preferences Section
            Text(
              "Account Preferences",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.password),
              title: Text("Change Password"),
              onTap: () {
                // Navigate to a change password screen if needed
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Change Password clicked"),
                ));
              },
            ),
            Divider(),

            // Notification Settings Section
            Text(
              "Notifications",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text("Enable Notifications"),
              value: isNotificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  isNotificationsEnabled = value;
                });
              },
            ),
            Divider(),

            // Theme Settings Section
            Text(
              "Theme",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text("Dark Theme"),
              value: isDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  isDarkTheme = value;
                  // Apply theme change logic here
                });
              },
            ),
            Divider(),

            // Logout Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout logic
                  Navigator.pushReplacementNamed(context, '/');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
