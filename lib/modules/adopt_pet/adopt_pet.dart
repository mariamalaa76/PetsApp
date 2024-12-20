import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class AdoptPet extends StatefulWidget{
  @override
  State<AdoptPet> createState() => _AdoptPetState();
}
class _AdoptPetState extends State<AdoptPet> {
  final List<Map<String, dynamic>> _products = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  void _showAddProductSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormFieldComponent(
                    controller: _nameController,
                    text: 'Pet Name',
                    txtInputType: TextInputType.text
                ),
                const SizedBox(height: 10),
                TextFormFieldComponent(
                    controller: _ageController,
                    text: 'pet Age',
                    txtInputType: TextInputType.text
                ),
                const SizedBox(height: 10),
                TextFormFieldComponent(
                    controller: _quantityController,
                    text: 'Pet Quantity',
                    txtInputType: TextInputType.text
                ),
                const SizedBox(height: 10),
                ElevatedButtonComponent(
                    function: (){
                      if (_nameController.text.isNotEmpty &&
                          _ageController.text.isNotEmpty &&
                          _quantityController.text.isNotEmpty) {
                        setState(() {
                          _products.add({
                            'name': _nameController.text,
                            'age': _ageController.text,
                            'quantity': _quantityController.text,
                          });
                        });
                        _nameController.clear();
                        _ageController.clear();
                        _quantityController.clear();
                        Navigator.pop(context);
                      }
                    },
                    text: 'Add Product'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adopt a Pet'),
        backgroundColor: Colors.teal,
      ),
      body: _products.isEmpty
          ? const Center(
        child: Text('No Pets added yet!',
            style: TextStyle(fontSize: 18)),
      )
          : ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product['name']),
              subtitle: Text(
                'Price: ${product['price']} \nQuantity: ${product['quantity']}',
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddProductSheet,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}