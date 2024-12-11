import 'package:flutter/material.dart';
import 'InvestorProjectListScreen.dart'; // Import the project list screen

class InvestorDashboardScreen extends StatefulWidget {
  @override
  _InvestorDashboardScreenState createState() =>
      _InvestorDashboardScreenState();
}

class _InvestorDashboardScreenState extends State<InvestorDashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    InvestorProjectListScreen(),
    ViewNegotiationsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Investor Dashboard"),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'View Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: 'View Negotiations',
          ),
        ],
      ),
    );
  }
}

class ViewNegotiationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Negotiations Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
