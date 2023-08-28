// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:my_app/components/my_button.dart';
import 'package:my_app/components/my_textfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  // Define the forgot password method
  void forgotPassword() {
    String email = emailController.text;
    // Implement your forgot password logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Forgot Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Image.network(
                      'https://cdn-icons-png.flaticon.com/128/5968/5968260.png'),
                  const SizedBox(height: 25),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    controller: emailController, // Use emailController
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    buttonText: 'Reset Password',
                    onTap: forgotPassword,
                    backgroundColor: Colors.orange, // Call the method
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
