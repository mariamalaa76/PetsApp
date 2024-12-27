import 'dart:io';

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
          borderSide: BorderSide(color: Colors.black),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor:HexColor('#bf9a84'),
      ),
      keyboardType: txtInputType,
    );

Widget ElevatedButtonComponent(
        {
          required Function function,
          required String text
        }) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:HexColor('#bf9a84') ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      onPressed: () => function(),
      child: Text(
        text,
        style: TextStyle(fontSize: 16,color: Colors.black),
      ),
    );

Widget TextButtonComponent(
        {required Function function, required String text}) =>
    TextButton(
      onPressed: () => function(),
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );

Widget PetItem (
{
  required String path,
  required String name,
}) =>
  Column(
    spacing: 8.0,
    mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(
        child: Container(
          height: 150.0,
          width: 150.0,
          child: Image.asset(
            path,
          ),
        ),
      ),
      Text(
        name,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 1,

      ),
      EVPITEM(
          function: (){},
          text: 'Add To Cart',
        ),

    ],
  );

Widget PetItem2({
  required String path,
  required String name,
  required VoidCallback onAddToCart,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onAddToCart,
          child: Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 4),
                  blurRadius: 6.0,
                ),
              ],
              border: Border.all(
                color: HexColor('#F0D0B8'),
                width: 2.0,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: path.isNotEmpty
                  ? Image.file(File(path), fit: BoxFit.cover)
                  : Icon(Icons.image, size: 50.0, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        ElevatedButton(
          onPressed: onAddToCart,
          child: Text('Add to Cart'),
        ),
      ],
    );


Widget EVPITEM(
    {
      required Function function,
      required String text
    }) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:HexColor('#bf9a84') ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      onPressed: () => function(),
      child: Text(
        text,
        style: TextStyle(fontSize: 14,color: Colors.black),
      ),
    );

