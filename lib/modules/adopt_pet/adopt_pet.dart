import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../shared/components/components.dart';

class AdoptPet extends StatefulWidget {
  @override
  State<AdoptPet> createState() => _AdoptPetState();
}

class _AdoptPetState extends State<AdoptPet> {
  final List<Map<String, dynamic>> _pets = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  File? _image;

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
                    text: 'Pet Age',
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
                    function: _pickImage,
                    text: 'Select Product Image'
                ),
                _image != null
                    ? Image.file(_image!)
                    : const Text('No image selected'),
                const SizedBox(height: 10),
                ElevatedButtonComponent(
                    function: () {
                      if (_nameController.text.isNotEmpty &&
                          _ageController.text.isNotEmpty &&
                          _quantityController.text.isNotEmpty) {
                        setState(() {
                          _pets.add({
                            'name': _nameController.text,
                            'age': _ageController.text,
                            'quantity': _quantityController.text,
                            'image': _image,
                          });
                        });
                        _nameController.clear();
                        _ageController.clear();
                        _quantityController.clear();
                        Navigator.pop(context);
                      }
                    },
                    text: 'Add Pets'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      } else {
        print("No image selected");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title:  Text('Adopt a Pet', style: TextStyle(color: Colors.black)),
        backgroundColor: HexColor('#F0D0B8'),
        iconTheme:  IconThemeData(color: Colors.black),
      ),
      body: _pets.isEmpty
          ? const Center(
        child: Text('No Pets added yet!', style: TextStyle(fontSize: 18)),
      )
          : ListView.builder(
        itemCount: _pets.length,
        itemBuilder: (context, index) {
          final product = _pets[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product['name']),
              subtitle: Text(
                'Price: ${product['price']} \nQuantity: ${product['quantity']}',
              ),
              isThreeLine: true,
              leading: product['image'] != null
                  ? Image.file(product['image'])
                  : null,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddProductSheet,
        backgroundColor: HexColor('#670b0b'),
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
