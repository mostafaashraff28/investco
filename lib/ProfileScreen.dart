import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false; // Toggles edit mode
  final _formKey = GlobalKey<FormState>();

  // User details (replace with dynamic data)
  String name = "John Doe";
  String email = "johndoe@example.com";
  String role = "Entrepreneur";
  String phone = "123-456-7890";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          // Settings Button in AppBar
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings'); // Navigate to SettingsScreen
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Header
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50), // Profile picture
                  ),
                  SizedBox(height: 10),
                  Text(
                    role,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Profile Details Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: name,
                    enabled: isEditing,
                    decoration: InputDecoration(labelText: "Name"),
                    validator: (value) =>
                        value!.isEmpty ? "Name cannot be empty" : null,
                    onSaved: (value) => name = value!,
                  ),
                  TextFormField(
                    initialValue: email,
                    enabled: false, // Email is not editable
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  TextFormField(
                    initialValue: phone,
                    enabled: isEditing,
                    decoration: InputDecoration(labelText: "Phone Number"),
                    validator: (value) =>
                        value!.isEmpty ? "Phone number cannot be empty" : null,
                    onSaved: (value) => phone = value!,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (isEditing) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          isEditing = false;
                          // Save changes to backend or local storage
                        }
                      } else {
                        isEditing = true;
                      }
                    });
                  },
                  child: Text(isEditing ? "Save Changes" : "Edit Profile"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle logout
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text("Logout"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
