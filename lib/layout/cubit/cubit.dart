import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/layout/cubit/states.dart';

class PetsCubit extends Cubit<PetsState> {
  PetsCubit() : super(PetsLoadingState());

  List<Map<String, dynamic>> pets = [
    {'name': 'Pet 1', 'image': 'https://example.com/pet1.jpg'},
    {'name': 'Pet 2', 'image': 'https://example.com/pet2.jpg'},
    {'name': 'Pet 3', 'image': 'https://example.com/pet3.jpg'},
  ];

  List<Map<String, dynamic>> cartItems = [];

  void loadPets() {
    emit(PetsLoadingState());
    // محاكاة التحميل من الإنترنت
    Future.delayed(Duration(seconds: 2), () {
      emit(PetsLoadedState(pets));
    });
  }

  void addToCart(Map<String, dynamic> pet) {
    cartItems.add(pet);
    emit(CartUpdatedState(cartItems));
  }

  void removeFromCart(Map<String, dynamic> pet) {
    cartItems.remove(pet);
    emit(CartUpdatedState(cartItems));
  }
  void addRandomPet() {
    pets.add({'name': 'Random Pet', 'image': 'https://example.com/random_pet.jpg'});
    emit(PetsLoadedState(pets));  // تحديث مع الحيوانات بعد الإضافة
  }
}
