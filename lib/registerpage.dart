import 'package:flutter/material.dart';
import 'package:my_app/components/my_button.dart';
import 'package:my_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  // Text editing controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // User registration method
  void registerUser() {
    // Implement your registration logic here
    // ignore: unused_local_variable
    String username = usernameController.text;
    // ignore: unused_local_variable
    String email = emailController.text;
    // ignore: unused_local_variable
    String password = passwordController.text;

    // Example logic: Register the user with the provided data
    // You can add your logic here, e.g., call an API, save data to a database, etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Register'),
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
                    'Create an Account',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // username
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // email
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // password
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    buttonText: 'Register',
                    onTap: registerUser,
                    backgroundColor: Colors.orange,
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
