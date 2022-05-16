import 'package:closestairport/global/constants/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'lastname_state.dart';

class LastNameCubit extends Cubit<LastNameState> {
  LastNameCubit() : super(LastNameState(isValid: true, isFocused: false));

  void checkLastName(String lastname)
  {
    var _isValid = Validator.validateLastName(lastname);
    print('LastNAME CUBIT: $_isValid');
    emit(LastNameState(isValid: _isValid, isFocused: state.isFocused));
  }

  void setFocusOnLastName(){
    emit(LastNameState(isValid: state.isValid, isFocused: true));
  }

  void setFocusOffLastName(){
    emit(LastNameState(isValid: state.isValid, isFocused: false));
  }
}