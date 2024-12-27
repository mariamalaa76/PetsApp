import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String path;
  final String name;
  final VoidCallback onAddToCart;
  final VoidCallback onRemove;

  const PetCard({
    Key? key,
    required this.path,
    required this.name,
    required this.onAddToCart,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Image.network(path, height: 120, width: double.infinity, fit: BoxFit.cover),
          Text(name),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: onAddToCart,
              ),
              IconButton(
                icon: Icon(Icons.remove_shopping_cart),
                onPressed: onRemove,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
