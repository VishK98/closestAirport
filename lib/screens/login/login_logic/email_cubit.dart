
import 'package:closestairport/global/constants/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailState(isValid: true, isFocused: false));

  void checkEmail(String email)
  {
    var _isValid = Validator.validateEmail(email);
    print('EMAIL CUBIT: $_isValid');
    emit(EmailState(isValid: _isValid, isFocused: state.isFocused));
  }

  void setFocusOnEmail(){
    emit(EmailState(isValid: state.isValid, isFocused: true));
  }

  void setFocusOffEmail(){
    emit(EmailState(isValid: state.isValid, isFocused: false));
  }
}
