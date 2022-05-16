import 'package:closestairport/global/constants/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'current_password_state.dart';

class CurrentPasswordCubit extends Cubit<CurrentPasswordState> {
  CurrentPasswordCubit() : super(CurrentPasswordState(isValid: true, isFocused: false));

  void checkCurrentPassword(String currentpassword)
  {
    var _isValid = Validator.validateContact(currentpassword);
    print('CURRENT PASSWORD: $_isValid');
    emit(CurrentPasswordState(isValid: _isValid, isFocused: state.isFocused));
  }

  void setFocusOnCurrentPassword(){
    emit(CurrentPasswordState(isValid: state.isValid, isFocused: true));
  }

  void setFocusOffCurrentPassword(){
    emit(CurrentPasswordState(isValid: state.isValid, isFocused: false));
  }
}