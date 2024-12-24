import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/layout/home_layout/home.dart';
import 'package:pets_app/modules/register/register.dart';
import 'package:pets_app/shared/components/components.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
   // bool _isPasswordVisible = false;
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => DataCubit(InitialDataState()),
      child: BlocConsumer<DataCubit, DataStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                              color: Colors.black),
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
                          obscureText: !DataCubit.get(context).isPasswordVisible,
                          text: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          txtInputType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              DataCubit.get(context).isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              DataCubit.get(context).changePasswordVisible();
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
        },
      ),
    );
  }
}
