import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isLogin = true; // Toggles between login and signup
  final _formKey = GlobalKey<FormState>();
  String role = 'Entrepreneur'; // Default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo
                Text(
                  "Shark Tank App",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      if (!isLogin)
                        TextFormField(
                          decoration: InputDecoration(labelText: "Full Name"),
                          validator: (value) =>
                              value!.isEmpty ? "Enter your name" : null,
                        ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            value!.isEmpty ? "Enter your email" : null,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Password"),
                        obscureText: true,
                        validator: (value) =>
                            value!.isEmpty ? "Enter your password" : null,
                      ),
                      if (!isLogin)
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Confirm Password"),
                          obscureText: true,
                          validator: (value) =>
                              value!.isEmpty ? "Confirm your password" : null,
                        ),
                      if (!isLogin)
                        DropdownButtonFormField<String>(
                          value: role,
                          items: [
                            DropdownMenuItem(
                                value: "Entrepreneur",
                                child: Text("Entrepreneur")),
                            DropdownMenuItem(
                                value: "Investor", child: Text("Investor")),
                            DropdownMenuItem(
                                value: "Consultant", child: Text("Consultant")),
                          ],
                          onChanged: (value) {
                            setState(() {
                              role = value!;
                            });
                          },
                          decoration:
                              InputDecoration(labelText: "Select Your Role"),
                        ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, '/roleSelection');
                          }
                        },
                        child: Text(isLogin ? "Login" : "Signup"),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isLogin = !isLogin;
                            

                          });
                        },
                        child: Text(isLogin
                            ? "Don't have an account? Signup here."
                            : "Already have an account? Login here."),
                      ),
                    ],
                  ),
                ),
                // Third-party login (optional)
                if (isLogin)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.g_mobiledata),
                        onPressed: () {
                          // Handle Google login
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () {
                          // Handle Facebook login
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
