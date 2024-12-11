import 'package:flutter/material.dart';

class ConsultantDashboardScreen extends StatefulWidget {
  @override
  _ConsultantDashboardScreenState createState() => _ConsultantDashboardScreenState();
}

class _ConsultantDashboardScreenState extends State<ConsultantDashboardScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> consultations = [
    {"id": "1", "user": "John Doe", "status": "Pending"},
    {"id": "2", "user": "Jane Smith", "status": "Approved"},
  ];

  final List<Map<String, dynamic>> appointments = [
    {"id": "1", "date": "12 Dec 2024", "time": "10:00 AM", "user": "John Doe"},
    {"id": "2", "date": "13 Dec 2024", "time": "2:00 PM", "user": "Jane Smith"},
  ];

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      _buildUpcomingAppointments(),
      _buildConsultationRequests(),
      _buildAppointments(),
    ]);
  }

  Widget _buildUpcomingAppointments() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Upcoming Appointments",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text("Appointment with ${appointment['user']}"),
                  subtitle: Text(
                      "Date: ${appointment['date']} | Time: ${appointment['time']}"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildConsultationRequests() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Consultation Requests",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: consultations.length,
            itemBuilder: (context, index) {
              final request = consultations[index];
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
        ),
      ],
    );
  }

  Widget _buildAppointments() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Appointments",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text("Appointment with ${appointment['user']}"),
                  subtitle: Text(
                      "Date: ${appointment['date']} | Time: ${appointment['time']}"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultant Dashboard"),
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
            icon: Icon(Icons.calendar_today),
            label: 'Upcoming Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'View Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'View Appointments',
          ),
        ],
      ),
    );
  }
}