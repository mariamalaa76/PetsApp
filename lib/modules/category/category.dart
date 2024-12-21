import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pets_app/modules/adopt_pet/adopt_pet.dart';
import 'package:pets_app/modules/products/product.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,

        ),
        title: Text(
          'Explore Categories',
          style: TextStyle(
              color: Colors.black,
               fontWeight: FontWeight.w600),
        ),
        backgroundColor: HexColor('#E8C0A0'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'What are you looking for?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(builder: (context) => AdoptPet()),

                );
              },
              child: CategoryCard(
                title: 'Adopt a Pet',
                icon: Icons.pets,
                color: Colors.orangeAccent,
                texColor: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductScreen()),
                );
              },
              child: CategoryCard(
                title: 'Shop Products',
                icon: Icons.shopping_bag,
                color: Colors.lightBlueAccent,
                texColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Color texColor;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.texColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.black),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: texColor,
            ),
          ),
        ],
      ),
    );
  }
}