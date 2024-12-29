// FarmersSignUpPage is a stateful widget that allows farmers to signup to the application
import 'package:flutter/material.dart';

class FarmerSignUpPage extends StatefulWidget {
  FarmerSignUpPage({super.key});

  @override
  _FarmerSignUpPageState createState() => _FarmerSignUpPageState();
}

class _FarmerSignUpPageState extends State<FarmerSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  // function to dispose controllers hence avoiding memory leaks
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Farmer Sign Up',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
        )
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Create Your account',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)
              textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Please enter a valid username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                
              )
            ]
          )
        )
      )
    )
  }
}