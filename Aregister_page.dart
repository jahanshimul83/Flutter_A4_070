import 'package:flutter/material.dart';
import 'Aauth_data.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void register() {
    if (_formKey.currentState!.validate()) {
      AuthData.name = _nameController.text;
      AuthData.email = _emailController.text;
      AuthData.password = _passwordController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration Successful!'),
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Page'),
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: SizedBox(
            width: 350,

            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  const Icon(
                    Icons.person_add,
                    size: 70,
                    color: Colors.blue,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Registration Form',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Name
                  TextFormField(
                    controller: _nameController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field is empty!!";
                      }

                      if (!RegExp(
                        r'^[a-zA-Z ]{3,}$',
                      ).hasMatch(value)) {
                        return "Enter a valid name!";
                      }

                      return null;
                    },

                    decoration: const InputDecoration(
                      labelText: "Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Email
                  TextFormField(
                    controller: _emailController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field is empty!!";
                      }

                      if (!RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      ).hasMatch(value)) {
                        return "Enter a valid email!";
                      }

                      return null;
                    },

                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field is empty!!";
                      }

                      if (!RegExp(
                        r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@$#&+=])(?=\S+$).{8,}$',
                      ).hasMatch(value)) {
                        return "Enter a strong password!";
                      }

                      return null;
                    },

                    decoration: const InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Confirm Password
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field is empty!!";
                      }

                      if (_passwordController.text != value) {
                        return "Password and confirm password don't match!";
                      }

                      return null;
                    },

                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Register Button
                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: register,
                      child: const Text('Register'),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Login Navigation
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text(
                      'Already have an account? Login',
                    ),
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