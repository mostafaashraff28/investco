import 'package:flutter/material.dart';

class EntrepreneurDashboardScreen extends StatefulWidget {
  @override
  _EntrepreneurDashboardScreenState createState() =>
      _EntrepreneurDashboardScreenState();
}

class _EntrepreneurDashboardScreenState
    extends State<EntrepreneurDashboardScreen> {
  final List<String> projects = [
    "Project Alpha",
    "Project Beta",
    "Project Gamma"
  ]; // Replace with dynamic data

  final List<String> otherProjects = [
    "Project Delta",
    "Project Epsilon",
    "Project Zeta",
    "Project Eta",
    "Project Theta"
  ]; // Replace with dynamic data

  final List<String> notifications = [
    "Investor John showed interest in Project Alpha.",
    "Consultant Jane approved your consultation request."
  ]; // Replace with dynamic data

  int _currentIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrepreneur Dashboard"),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.notifications),
            itemBuilder: (context) => notifications
                .map((notification) => PopupMenuItem<String>(
                      value: notification,
                      child: Text(notification),
                    ))
                .toList(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: _currentIndex == 0
            ? _buildDashboardContent()
            : _currentIndex == 1
                ? _buildProjectsContent()
                : _buildConsultationContent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/AddEditProjectScreen');
        },
        child: Icon(Icons.add),
        tooltip: "Add New Project",
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: "Projects",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support),
            label: "Consult Specialist",
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Project Summary Section
        Text(
          "Your Projects",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: ListTile(
                  title: Text(projects[index]),
                  subtitle: Text("Funding Status: In Progress"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Clicked on ${projects[index]}"),
                    ));
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProjectsContent() {
    final List<String> allProjects = [...projects, ...otherProjects];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "All Projects",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: allProjects.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: ListTile(
                  title: Text(allProjects[index]),
                  subtitle: index < projects.length
                      ? Text("Your Project - Funding Status: In Progress")
                      : Text("Other Project - Status: Under Consideration"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Clicked on ${allProjects[index]}"),
                    ));
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildConsultationContent() {
    return Center(
      child: Text(
        "Consultation Section",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
