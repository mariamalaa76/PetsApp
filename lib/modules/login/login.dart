import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pets_app/layout/home_layout/home.dart';
import 'package:pets_app/modules/register/register.dart';
import 'package:pets_app/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F0D0B8'),
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
                    Icons.lock_outline,
                    size: 100,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                      prefixIcon: Icon(Icons.email),
                      txtInputType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  TextFormFieldComponent(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Password';
                        }
                      },
                      controller: passwordController,
                    obscureText: !_isPasswordVisible
                    ,
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
                  const SizedBox(height: 24),
                  ElevatedButtonComponent(

                      function: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );

                        }
                      },

                      text: 'Login'),
                  const SizedBox(height: 16),
                  TextButtonComponent(
                      function: () {}, text: 'Forgot Password?'),
                  TextButtonComponent(
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      text: 'Do Not Have Account?'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
