abstract class PetsState {}

class PetsLoadingState extends PetsState {}

class PetsLoadedState extends PetsState {
  final List<Map<String, dynamic>> pets;

  PetsLoadedState(this.pets);
}

class CartUpdatedState extends PetsState {
  final List<Map<String, dynamic>> cartItems;

  CartUpdatedState(this.cartItems);
}

class LoadingState extends PetsState {}
