import 'package:flutter/material.dart';
import 'InvestorProjectDetailsScreen.dart'; // Import the details screen

class InvestorProjectListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {
      "id": "1",
      "name": "Project Alpha",
      "funding": 100000,
      "equity": 10,
      "description": "A revolutionary tech project aiming to disrupt the industry.",
    },
    {
      "id": "2",
      "name": "Project Beta",
      "funding": 200000,
      "equity": 20,
      "description": "A healthcare project focused on remote patient monitoring.",
    },
    {
      "id": "3",
      "name": "Project Gamma",
      "funding": 150000,
      "equity": 15,
      "description": "An educational platform to make learning more accessible.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Projects"),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(project['name']),
              subtitle: Text(
                  "Funding: \$${project['funding']} | Equity: ${project['equity']}%"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InvestorProjectDetailsScreen(
                      project: project,
                    ),
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