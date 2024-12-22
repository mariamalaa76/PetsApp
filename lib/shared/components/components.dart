import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget TextFormFieldComponent(
        {required TextEditingController controller,
          bool? obscureText,
        required String text,
          Widget? prefixIcon,
        Widget? suffixIcon,
          TextInputType? txtInputType,
        String? Function(String?)? validator}) =>
    TextFormField(
      controller: controller,
      obscureText:obscureText ?? false ,
      validator: validator,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor : HexColor('#e4cfc3'),
         //hello
    ),
      keyboardType: txtInputType,
    );

Widget ElevatedButtonComponent(
        {required Function function, required String text}) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: HexColor('#e4cfc3'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      onPressed: () => function(),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
),
      ),
    );

Widget TextButtonComponent(
        {required Function function, required String text}) =>
    TextButton(
      onPressed: () => function(),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
