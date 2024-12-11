import 'package:flutter/material.dart';

import 'enterpruner/AddEditProjectScreen.dart';
import 'Consultant/CalendarAvailabilityScreen.dart';
import 'Consultant/ConsultantDashboardScreen.dart';
import 'Consultant/ConsultationBookingScreen.dart';
import 'Consultant/ConsultationDetailsScreen.dart';
import 'Consultant/ConsultationRequestListScreen.dart';
import 'enterpruner/EntrepreneurDashboardScreen.dart';
import 'Consultant/FeedbackReviewScreen.dart';
import 'Investor/InvestorDashboardScreen.dart';
import 'Investor/InvestorProjectDetailsScreen.dart';
import 'Investor/InvestorProjectListScreen.dart';
import 'Investor/InvestmentSummaryScreen.dart';
import 'ProfileScreen.dart';
import 'enterpruner/ProjectListScreen.dart';
import 'enterpruner/SettingsScreen.dart';
import 'login.dart';
import 'roleselection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shark Tank App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginSignupScreen(),
        '/roleSelection': (context) => RoleSelectionScreen(),
        '/profileScreen': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/ConsultationBookingScreen': (context) => ConsultationBookingScreen(),
        '/InvestorDashboardScreen': (context) => InvestorDashboardScreen(),
        '/InvestorProjectListScreen': (context) => InvestorProjectListScreen(),
        '/projectDetails': (context) => InvestorProjectDetailsScreen(project: {}),
        '/entrepreneurDashboard': (context) => EntrepreneurDashboardScreen(),
        '/AddEditProjectScreen': (context) => AddEditProjectScreen(),
        '/viewProjects': (context) => ProjectListScreen(),
        '/investmentSummary': (context) => InvestmentSummaryScreen(),
        '/consultationRequests': (context) => ConsultationRequestListScreen(),
        '/appointments': (context) => CalendarAvailabilityScreen(),
        '/feedbackReviews': (context) => FeedbackReviewScreen(),
        '/consultationDetails': (context) => ConsultationDetailsScreen(request: {}),
        '/consultSpecialist': (context) => PlaceholderScreen(title: 'Consult Specialist'),
        '/investorDashboard': (context) => PlaceholderScreen(title: 'Investor Dashboard'),
        '/consultantDashboard': (context) => ConsultantDashboardScreen(),
      },
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          '$title Placeholder',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}