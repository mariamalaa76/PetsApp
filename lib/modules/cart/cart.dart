import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Your Cart',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
        ),
      ),
    );
  }

}