import 'package:flutter/material.dart';

class ConsultationRequestListScreen extends StatelessWidget {
  // Sample data for consultation requests
  final List<Map<String, dynamic>> requests = [
    {"id": "1", "user": "John Doe", "status": "Pending"},
    {"id": "2", "user": "Jane Smith", "status": "Approved"},
    {"id": "3", "user": "Mike Johnson", "status": "Completed"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultation Requests"),
      ),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text("Request from ${request['user']}"),
              subtitle: Text("Status: ${request['status']}"),
              trailing: Icon(
                Icons.arrow_forward,
                color: request['status'] == "Pending"
                    ? Colors.orange
                    : request['status'] == "Approved"
                        ? Colors.green
                        : Colors.grey,
              ),
              onTap: () {
                // Navigate to consultation details
                Navigator.pushNamed(
                  context,
                  '/consultationDetails',
                  arguments: request,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
