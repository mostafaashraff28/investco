import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  final String userName = "John Doe"; // Replace with dynamic data
  final String userEmail = "johndoe@example.com"; // Replace with dynamic data
  final List<String> roles = ["Entrepreneur", "Investor", "Consultant"]; // User's roles

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Your Role"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // User Profile Section
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person, size: 30), // Replace with user's profile picture if available
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(userEmail, style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Role Selection Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: roles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to EntrepreneurDashboardScreen for Entrepreneur role
                      if (roles[index] == "Entrepreneur") {
                        Navigator.pushNamed(context, '/entrepreneurDashboard');
                      } else if (roles[index] == "Investor") {
                        Navigator.pushNamed(context, '/InvestorDashboardScreen');
                      } else if (roles[index] == "Consultant") {
                        Navigator.pushNamed(context, '/consultantDashboard');
                      }
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.dashboard, size: 40), // Replace with role-specific icons
                            SizedBox(height: 10),
                            Text(
                              roles[index],
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Logout Button
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
      ),
    );
  }
}
