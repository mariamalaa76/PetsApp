import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_app/modules/login/login.dart';

import '../../shared/components/components.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_add_alt_1,
                    size: 100,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextFormFieldComponent(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Email Address';
                        }
                      },
                      controller: emailController,
                      text: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      txtInputType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  TextFormFieldComponent(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Password';
                        }
                      },
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      text: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      txtInputType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                  ),
                  const SizedBox(height: 16),
                  TextFormFieldComponent(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Password';
                        }
                      },
                      controller: confirmPasswordController,
                      obscureText: !_isConfirmPasswordVisible,
                      text: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock),
                      txtInputType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                  ),
                  const SizedBox(height: 16),
                  TextFormFieldComponent(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Address';
                      }
                    },
                    controller: addressController,
                    text: 'Address',
                    prefixIcon: const Icon(Icons.location_on),
                    txtInputType: TextInputType.streetAddress,
                  ),
                  const SizedBox(height: 16),
                  TextFormFieldComponent(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Phone Number';
                      }
                    },
                    controller: phoneController,
                    text: 'Phone Number',
                    prefixIcon: const Icon(Icons.phone_android),
                    txtInputType: TextInputType.phone,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButtonComponent(
                      function: () {
                        final password = passwordController.text;
                        final confirmPassword = confirmPasswordController.text;
                        if (password != confirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Passwords do not match!'),
                            ),
                          );
                        } else if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        }
                      },
                      text: 'Register'),
                  const SizedBox(height: 16),
                  TextButtonComponent(
                      text: 'Already have an account? Login',
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
