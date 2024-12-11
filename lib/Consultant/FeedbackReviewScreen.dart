import 'package:flutter/material.dart';

class FeedbackReviewScreen extends StatelessWidget {
  final List<Map<String, dynamic>> feedbacks = [
    {"user": "John Doe", "rating": 5, "comment": "Excellent consultation!"},
    {"user": "Jane Smith", "rating": 4, "comment": "Very helpful and professional."},
    {"user": "Mike Johnson", "rating": 3, "comment": "Good, but could improve communication."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback & Reviews"),
      ),
      body: ListView.builder(
        itemCount: feedbacks.length,
        itemBuilder: (context, index) {
          final feedback = feedbacks[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(feedback['user']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rating: ${feedback['rating']}⭐"),
                  Text("Comment: ${feedback['comment']}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
