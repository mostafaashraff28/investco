import 'package:flutter/material.dart';
import 'InvestorProjectDetailsScreen.dart'; // Import the InvestorProjectDetailsScreen

class InvestmentSummaryScreen extends StatelessWidget {
  // Sample investment data
  final List<Map<String, dynamic>> investments = [
    {
      "id": "1",
      "name": "Project Alpha",
      "amountInvested": 50000,
      "equityShare": 5,
      "industry": "Tech",
      "location": "New York",
    },
    {
      "id": "2",
      "name": "Project Beta",
      "amountInvested": 100000,
      "equityShare": 10,
      "industry": "Health",
      "location": "San Francisco",
    },
    {
      "id": "3",
      "name": "Project Gamma",
      "amountInvested": 75000,
      "equityShare": 7.5,
      "industry": "Education",
      "location": "Los Angeles",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Investment Summary"),
      ),
      body: ListView.builder(
        itemCount: investments.length,
        itemBuilder: (context, index) {
          final investment = investments[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(investment['name']),
              subtitle: Text(
                "Invested: \$${investment['amountInvested']} | Equity: ${investment['equityShare']}%",
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to detailed view of the investment/project
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InvestorProjectDetailsScreen(
                      project: investment,
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