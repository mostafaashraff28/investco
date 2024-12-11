import 'package:flutter/material.dart';

class CalendarAvailabilityScreen extends StatefulWidget {
  @override
  _CalendarAvailabilityScreenState createState() =>
      _CalendarAvailabilityScreenState();
}

class _CalendarAvailabilityScreenState
    extends State<CalendarAvailabilityScreen> {
  final List<DateTime> availableDates = [];

  void _addAvailability() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null && !availableDates.contains(pickedDate)) {
      setState(() {
        availableDates.add(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Availability"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _addAvailability,
            child: Text("Add Available Date"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: availableDates.length,
              itemBuilder: (context, index) {
                final date = availableDates[index];
                return ListTile(
                  title: Text(
                      "${date.day}/${date.month}/${date.year} (Available)"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        availableDates.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
