import 'package:flutter/material.dart';

class ConsultationDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> request;

  const ConsultationDetailsScreen({Key? key, required this.request})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultation Request"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Request Details
            Text(
              "Request from: ${request['user']}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Status: ${request['status']}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Description: ${request['description'] ?? 'No additional details provided.'}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Accept the consultation request
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Request Accepted"),
                      backgroundColor: Colors.green,
                    ));
                    Navigator.pop(context);
                  },
                  child: Text("Accept"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Decline the consultation request
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Request Declined"),
                      backgroundColor: Colors.red,
                    ));
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Decline"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
