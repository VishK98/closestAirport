import 'package:closestairport/global/constants/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'confirm_password_state.dart';

class ConfirmPasswordCubit extends Cubit<ConfirmPasswordState> {
  ConfirmPasswordCubit() : super(ConfirmPasswordState(isValid: true, isFocused: false));

  void checkConfirmPassword(String confirmpassword)
  {
    var _isValid = Validator.validateContact(confirmpassword);
    print('CONFIRM PASSWORD: $_isValid');
    emit(ConfirmPasswordState(isValid: _isValid, isFocused: state.isFocused));
  }

  void setFocusOnConfirmPassword(){
    emit(ConfirmPasswordState(isValid: state.isValid, isFocused: true));
  }

  void setFocusOffConfirmPassword(){
    emit(ConfirmPasswordState(isValid: state.isValid, isFocused: false));
  }
}