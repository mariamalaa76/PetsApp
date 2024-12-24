import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/layout/cubit/states.dart';

class DataCubit extends Cubit<DataStates> {
  DataCubit(super.initialState);
  static DataCubit get(context) => BlocProvider.of(context);

  String? firstName;
  String? email;
  String? address;
  String? phone_num;

   bool isPasswordVisible = false;
   bool isConfirmPasswordVisible = false;

  void changePasswordVisible(){
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibleState(isPasswordVisible));
  }

  void changeConfirmPasswordVisible(){
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ChangeConfirmPasswordVisibleState(isConfirmPasswordVisible));
  }

  void updateName(String newFirstName) {
    firstName = newFirstName;
    emit(UpdateNameState(newFirstName));
  }

  void updateEmail(String newEmail) {
    email = newEmail;
    emit(UpdateEmailState(newEmail));
  }

  void updateAddress(String newAddress) {
    address = newAddress;
    emit(UpdateAddressState(newAddress));
  }

  void updatePhone(String newPhone_num) {
    phone_num = newPhone_num;
    emit(UpdatePhoneState(newPhone_num));
  }
}


