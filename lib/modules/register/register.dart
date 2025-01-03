import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/modules/login/login.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController secondNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

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
                                  return 'Enter Your First Name';
                                }
                              },
                              controller: firstNameController,
                              text: 'First Name',
                              prefixIcon:
                                  const Icon(Icons.account_circle_rounded),
                              txtInputType: TextInputType.text),
                          const SizedBox(height: 16),
                          TextFormFieldComponent(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Your Second Name';
                                }
                              },
                              controller: secondNameController,
                              text: 'Second Name',
                              prefixIcon:
                                  const Icon(Icons.account_circle_rounded),
                              txtInputType: TextInputType.text),
                          const SizedBox(height: 16),
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
                            obscureText:
                                !DataCubit.get(context).isPasswordVisible,
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
                          const SizedBox(height: 16),
                          TextFormFieldComponent(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Password';
                              }
                            },
                            controller: confirmPasswordController,
                            obscureText: !DataCubit.get(context)
                                .isConfirmPasswordVisible,
                            text: 'Confirm Password',
                            prefixIcon: const Icon(Icons.lock),
                            txtInputType: TextInputType.visiblePassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                DataCubit.get(context).isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                DataCubit.get(context)
                                    .changeConfirmPasswordVisible();
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
                                final confirmPassword =
                                    confirmPasswordController.text;
                                if (password != confirmPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Passwords do not match!'),
                                    ),
                                  );
                                } else if (formKey.currentState!.validate()) {
                                  DataCubit.get(context)
                                      .updateName(firstNameController.text);
                                  DataCubit.get(context)
                                      .updateEmail(emailController.text);
                                  DataCubit.get(context)
                                      .updateAddress(addressController.text);
                                  DataCubit.get(context)
                                      .updatePhone(phoneController.text);
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
          }),
    );
  }
}
