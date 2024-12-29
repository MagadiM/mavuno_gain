import 'package:flutter/material.dart';
import 'package:mavuno_gain/main.dart';
import 'package:mavuno_gain/screens/farmersignup.dart';

// Farmer login widget screen 
class FarmerLogin extends StatelessWidget {
  FarmerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            'Farmer Login Page',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      // body widget which has a login form
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Username field
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Personal Identification Number field
            TextField(
              decoration: InputDecoration(
                labelText: 'Personal Identification Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            // Password field
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Hides the input for passwords
            ),
            SizedBox(height: 20),
            // Login button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MavunoHomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
              // validating form
              // validator: () {
              //     if (password != pass || value.isEmpty) {
              //       return 'Confirm password';
              //     }
              //     if (value != _passwordController.text) {
              //       return 'Password does not match';
              //     }
              //     return null;
              //   },
            ),
            SizedBox(height: 20),
            // Sign-up link
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FarmerSignUpPage()),
                );
              },
              child: Text(
                'Don\'t have an account? Sign Up Here',
                style: TextStyle(color: Colors.green),
              ),
            ),
            // Forgot password link
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MavunoHomePage()),
                );
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
