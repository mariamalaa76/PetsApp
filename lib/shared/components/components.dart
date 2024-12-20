import 'package:flutter/material.dart';

Widget TextFormFieldComponent(
        {required TextEditingController controller,
          bool? obscureText,
        required String text,
          Widget? prefixIcon,
        Widget? suffixIcon,
        required TextInputType txtInputType,
        String? Function(String?)? validator}) =>
    TextFormField(
      controller: controller,
      obscureText:obscureText ?? false ,
      validator: validator,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.teal)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: txtInputType,
    );

Widget ElevatedButtonComponent(
        {required Function function, required String text}) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      onPressed: () => function(),
      child: Text(
        text,
        style: TextStyle(fontSize: 16,color: Colors.teal),
      ),
    );

Widget TextButtonComponent(
        {required Function function, required String text}) =>
    TextButton(
      onPressed: () => function(),
      child: Text(
        text,
        style: TextStyle(color: Colors.teal),
      ),
    );
