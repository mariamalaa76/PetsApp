import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/layout/cubit/cubit.dart';
import 'package:pets_app/modules/login/login.dart';

import 'modules/cart/cart.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => PetsCubit()..loadPets(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pets App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
