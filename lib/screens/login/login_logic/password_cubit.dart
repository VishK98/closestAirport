import 'package:closestairport/global/constants/validators.dart';
import 'package:closestairport/screens/login/login_logic/email_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {

  PasswordCubit() : super(PasswordState(isValid:true,isPasswordVisible: false, isFocused: false));

  void hidePassword () => emit(PasswordState(isValid: state.isValid,isPasswordVisible: false, isFocused: state.isFocused));
  void showPassword () => emit(PasswordState(isValid: state.isValid,isPasswordVisible: true, isFocused: state.isFocused));

  void onFocus() => emit(PasswordState(isValid: state.isValid,isPasswordVisible: state.isPasswordVisible, isFocused: true));
  void offFocus() => emit(PasswordState(isValid: state.isValid,isPasswordVisible: state.isPasswordVisible, isFocused: false));

  void checkPassword(String value)
  {
    var _isValid = Validator.validatePassword(value);
    emit(PasswordState(isValid: _isValid,isPasswordVisible: state.isPasswordVisible, isFocused: state.isFocused));
  }
}
