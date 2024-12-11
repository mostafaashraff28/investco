import 'package:flutter/material.dart';
import 'AddEditProjectScreen.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> project; // Pass project details as a Map
  final bool isOwner; // Indicates if the current user owns the project

  const ProjectDetailsScreen({Key? key, required this.project, this.isOwner = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Name
            Text(
              project['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Industry and Funding
            Text("Industry: ${project['industry']}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text("Funding: \$${project['funding']}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text("Equity Offered: ${project['equity']}%", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),

            // Project Description
            Text("Description:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
              project['description'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Image (Optional)
            if (project.containsKey('image') && project['image'] != null)
              Center(
                child: Image.network(
                  project['image'],
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: 20),

            // Actions Section
            if (isOwner)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to AddEditProjectScreen for editing
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEditProjectScreen(
                            projectId: project['id'],
                            projectData: project,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.edit),
                    label: Text("Edit"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Confirm and delete the project
                      _confirmDelete(context);
                    },
                    icon: Icon(Icons.delete),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    label: Text("Delete"),
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle expressing interest
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Expressed interest in ${project['name']}")));
                    },
                    icon: Icon(Icons.star),
                    label: Text("Express Interest"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to interactions or negotiations screen
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Navigate to interactions for ${project['name']}")));
                    },
                    icon: Icon(Icons.chat),
                    label: Text("View Interactions"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Project"),
          content: Text("Are you sure you want to delete this project?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle project deletion
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${project['name']} deleted successfully.")));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
