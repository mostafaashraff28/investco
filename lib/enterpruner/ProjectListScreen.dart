import 'package:flutter/material.dart';
import 'ProjectDetailsScreen.dart';

class ProjectListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {
      'id': '1',
      'name': 'EcoFriendly Solutions',
      'industry': 'Environment',
      'funding': 50000,
      'equity': 10,
      'description': 'A startup focused on sustainable products.',
      'image': 'https://via.placeholder.com/200',
    },
    {
      'id': '2',
      'name': 'TechWave',
      'industry': 'Technology',
      'funding': 120000,
      'equity': 20,
      'description': 'Innovative software for healthcare.',
      'image': 'https://via.placeholder.com/200',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Projects")),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return ListTile(
            title: Text(project['name']),
            subtitle: Text("Industry: ${project['industry']}"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectDetailsScreen(
                    project: project,
                    isOwner: true, // Adjust based on the user role
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
