import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pets_app/layout/cubit/cubit.dart';
import 'layout/cubit/states.dart';
import 'modules/login/login.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => DataCubit(InitialDataState()),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginScreen(),
      theme: ThemeData(
          scaffoldBackgroundColor: HexColor('#F0D0B8'),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: HexColor('#F0D0B8'),
            selectedItemColor: Colors.black//HexColor('#670b0b'),
          ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }
}