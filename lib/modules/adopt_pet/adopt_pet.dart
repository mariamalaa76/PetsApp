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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  File? _image;

  final List<Map<String, dynamic>> _pets = [];

  void _showAddProductSheet() {
    showModalBottomSheet(
      backgroundColor: HexColor('#F0D0B8'),
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
                    txtInputType: TextInputType.text),
                const SizedBox(height: 10),
                TextFormFieldComponent(
                    controller: _ageController,
                    text: 'Pet Age',
                    txtInputType: TextInputType.text),
                const SizedBox(height: 10),
                TextFormFieldComponent(
                    controller: _quantityController,
                    text: 'Pet Quantity',
                    txtInputType: TextInputType.text),
                const SizedBox(height: 10),
                ElevatedButtonComponent(
                    function:_pickImage
                     , text: 'Select Pet Image'),
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
                            'image': _image,
                          });
                        });
                        _nameController.clear();
                        _ageController.clear();
                        _quantityController.clear();
                        Navigator.pop(context);
                      }
                    },
                    text: 'Add Pet'),
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
        title: Text(
          'Adopt a Pet',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        backgroundColor: HexColor('#F0D0B8'),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: _pets.isEmpty
          ? const Center(
              child: Text('No pets added yet!', style: TextStyle(fontSize: 18)),
            )
          : Padding(
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
                  path: _pets[index]['image']?.path ?? '',
                  name: _pets[index]['name']!,
                ),
                itemCount: _pets.length,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddProductSheet,
        backgroundColor: HexColor('#F0D0B8'),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

Widget PetItem({
  required String path,
  required String name,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
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
                ? Image.file(
                    File(path),
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.image,
                    size: 50.0,
                    color: Colors.grey,
                  ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
      ],
    );
