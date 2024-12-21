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
        scaffoldBackgroundColor: HexColor('#E8C0A0'),
        appBarTheme: AppBarTheme(
          color: HexColor('#E8C0A0'),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: HexColor('#E8C0A0'),
          elevation: 0,
          selectedItemColor: HexColor('#670b0b'),
        )
      ),
    );
  }
}
