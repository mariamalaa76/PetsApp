import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Your Profile',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
        ),
      ),
    );
  }

}