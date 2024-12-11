import 'package:flutter/material.dart';

class InvestorProjectDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> project;

  const InvestorProjectDetailsScreen({Key? key, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Industry: ${project['industry']}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 5),
              Text(
                "Location: ${project['location']}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 5),
              Text(
                "Funding Required: \$${project['funding']}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 5),
              Text(
                "Equity Offered: ${project['equity']}%",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "Description:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                project['description'],
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
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
              ElevatedButton(
                onPressed: () {
                  // Handle investment action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Invested in ${project['name']}")),
                  );
                },
                child: Text("Invest"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}