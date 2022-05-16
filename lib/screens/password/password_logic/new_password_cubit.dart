import 'package:closestairport/global/constants/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(NewPasswordState(isValid: true, isFocused: false));

  void checkNewPassword(String newpassword)
  {
    var _isValid = Validator.validateContact(newpassword);
    print('NEW PASSWORD: $_isValid');
    emit(NewPasswordState(isValid: _isValid, isFocused: state.isFocused));
  }

  void setFocusOnNewPassword(){
    emit(NewPasswordState(isValid: state.isValid, isFocused: true));
  }

  void setFocusOffNewPassword(){
    emit(NewPasswordState(isValid: state.isValid, isFocused: false));
  }
}