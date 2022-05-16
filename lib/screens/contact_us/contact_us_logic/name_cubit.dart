import 'package:closestairport/global/constants/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'name_state.dart';

class NameCubit extends Cubit<NameState> {
  NameCubit() : super(NameState(isValid: true, isFocused: false));

  void checkName(String name)
  {
    var _isValid = Validator.validateName(name);
    print('NAME CUBIT: $_isValid');
    emit(NameState(isValid: _isValid, isFocused: state.isFocused));
  }

  void setFocusOnName(){
    emit(NameState(isValid: state.isValid, isFocused: true));
  }

  void setFocusOffFirstName(){
    emit(NameState(isValid: state.isValid, isFocused: false));
  }
}