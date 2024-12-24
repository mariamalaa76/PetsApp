abstract class DataStates {}

class InitialDataState extends DataStates {}

class ChangePasswordVisibleState extends DataStates {
  final bool isPasswordVisible;
  ChangePasswordVisibleState(this.isPasswordVisible);

}

class ChangeConfirmPasswordVisibleState extends DataStates {
  final bool isConfirmPasswordVisible;
  ChangeConfirmPasswordVisibleState(this.isConfirmPasswordVisible);
}

class UpdateEmailState extends DataStates {
  final String email;
  UpdateEmailState(this.email);
}

class UpdateNameState extends DataStates {
  final String name;
  UpdateNameState(this.name);
}

class UpdateAddressState extends DataStates {
  final String address;
  UpdateAddressState(this.address);
}

class UpdatePhoneState extends DataStates {
  final String phone;
  UpdatePhoneState(this.phone);
}



