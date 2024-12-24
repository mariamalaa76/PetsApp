import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pets_app/shared/components/components.dart';
class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final List<Map<String, String>> petItems = [
    {'path': 'assets/images/1.png', 'name': 'Cat Food Vector'},
    {'path': 'assets/images/2.png', 'name': 'Cat Food Packaging Bag'},
    {'path': 'assets/images/3.png', 'name': 'Glasses For Dogs'},
    {'path': 'assets/images/4.png', 'name': 'Dog Cat Nutrient '},
    {'path': 'assets/images/5.png', 'name': ' Dog biscuit '},
    {'path': 'assets/images/6.png', 'name': 'Cat Food'},
    {'path': 'assets/images/7.png', 'name': 'Cat Food Whiskas'},
    {'path': 'assets/images/8.png', 'name': 'Cat Food Dog Chicken'},
    {'path': 'assets/images/9.png', 'name': 'Cat Food Dog Food Puppy'},
    {'path': 'assets/images/10.png', 'name': 'Cat Litter Trays Kitten Pet Dog'},
    {'path': 'assets/images/11.png', 'name': 'Outlast Dog crate Snoozer'},
    {'path': 'assets/images/12.png', 'name': 'Dog And Cat'},
    {'path': 'assets/images/13.png', 'name': 'Dog Pet Handbag Backpack'},
    {'path': 'assets/images/14.png', 'name': 'Animal cage'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop Products',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: HexColor('#F0D0B8'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) => PetItem(
            path: petItems[index]['path']!,
            name: petItems[index]['name']!,
          ),
          itemCount: 14,
        ),
      ),
    );
  }
}