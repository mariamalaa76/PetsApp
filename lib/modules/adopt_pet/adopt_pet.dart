import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/layout/cubit/cubit.dart';
import 'package:pets_app/modules/cart/pet_card.dart';
import 'package:pets_app/shared/components/components.dart';
import '../../layout/cubit/states.dart';

class AdoptPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adopt a Pet'),
        backgroundColor: Colors.orange,
      ),
      body: BlocConsumer<PetsCubit, PetsState>(
        listener: (context, state) {
          if (state is CartUpdatedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Cart updated!')),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PetsLoadedState) {
            final pets = state.pets;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                return PetCard(
                  path: pet['image'] ?? 'default_image_url',
                  name: pet['name'] ?? 'No name available',
                  onAddToCart: () {
                    context.read<PetsCubit>().addToCart(pet);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${pet['name']} added to cart!')),
                    );
                  },
                  onRemove: () {},
                );
              },
            );
          }
          return Center(child: Text('No pets available'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // هنا نقوم باستخدام `emit` لتحديث الحالة في Cubit
          context.read<PetsCubit>().addRandomPet();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Random pet added!')),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
