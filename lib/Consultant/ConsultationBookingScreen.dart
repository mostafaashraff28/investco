import 'package:flutter/material.dart';

class ConsultationBookingScreen extends StatefulWidget {
  @override
  _ConsultationBookingScreenState createState() =>
      _ConsultationBookingScreenState();
}

class _ConsultationBookingScreenState extends State<ConsultationBookingScreen> {
  String? selectedConsultant;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final _descriptionController = TextEditingController();

  // Sample consultants list
  final List<String> consultants = [
    "Consultant A",
    "Consultant B",
    "Consultant C",
  ];

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _submitBooking() {
    if (selectedConsultant == null ||
        selectedDate == null ||
        selectedTime == null ||
        _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill in all fields."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final bookingDetails = {
      "consultant": selectedConsultant,
      "date": selectedDate,
      "time": selectedTime!.format(context),
      "description": _descriptionController.text,
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Consultation booked successfully!"),
        backgroundColor: Colors.green,
      ),
    );

    // Here you would send the booking details to the backend
    print("Booking Details: $bookingDetails");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Consultation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Consultant Selection
              Text(
                "Select Consultant",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedConsultant,
                items: consultants
                    .map((consultant) => DropdownMenuItem(
                          value: consultant,
                          child: Text(consultant),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedConsultant = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Select a consultant",
                ),
              ),
              SizedBox(height: 20),

              // Date Picker
              Text(
                "Select Date",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    selectedDate == null
                        ? "Select a date"
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Time Picker
              Text(
                "Select Time",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => _selectTime(context),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    selectedTime == null
                        ? "Select a time"
                        : selectedTime!.format(context),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Assistance Description
              Text(
                "Describe Assistance Needed",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter details about the assistance you need",
                ),
              ),
              SizedBox(height: 20),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: _submitBooking,
                  child: Text("Book Consultation"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
