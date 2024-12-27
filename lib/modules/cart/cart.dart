import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/layout/cubit/cubit.dart';
import 'package:pets_app/modules/cart/pet_card.dart';
import 'package:pets_app/shared/components/components.dart';
import '../../layout/cubit/states.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.orange,
      ),
      body: BlocBuilder<PetsCubit, PetsState>(
        builder: (context, state) {
          if (state is PetsLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PetsLoadedState) {
            final cartItems = context.read<PetsCubit>().cartItems;
            return cartItems.isEmpty
                ? Center(child: Text('No pets in the cart yet!'))
                : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.7,
              ),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final pet = cartItems[index];
                return PetCard(
                  path: pet['image'] ?? '',
                  name: pet['name'] ?? '',
                  onAddToCart: () {
                    // إضافة العنصر إلى السلة
                    context.read<PetsCubit>().addToCart(pet);
                  },
                  onRemove: () {
                    // إزالة العنصر من السلة باستخدام الكائن بدلاً من الـ index
                    context.read<PetsCubit>().removeFromCart(pet);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${pet['name']} removed from cart!'),
                      ),
                    );
                  },
                );
              },
            );
          }
          return Center(child: Text('No items in cart'));
        },
      ),
    );
  }
}
