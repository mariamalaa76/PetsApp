import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/home_layout/home.dart';
import 'modules/category/category.dart';
import 'modules/login/login.dart';
import 'modules/register/register.dart';

void main() {
  runApp(const MyApp());
}
//mostafa
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
          selectedItemColor: HexColor('#670b0b'),
        )
      ),
    );
  }
}
