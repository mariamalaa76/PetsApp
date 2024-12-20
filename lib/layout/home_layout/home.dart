import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_app/modules/cart/cart.dart';
import 'package:pets_app/modules/profile/profile.dart';
import '../../modules/category/category.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //     onPressed: (){},
      //   child: Icon(Icons.add),
      // ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
          onTap: (index)
          {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.home
                ),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.shopping_cart
                ),
                label: 'My Cart'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.account_circle
                ),
                label: 'Profile'
            )
          ],
      ),
    );
  }
}