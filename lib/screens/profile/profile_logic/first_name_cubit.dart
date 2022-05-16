// import 'package:closestairport/global/constants/validators.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// part 'first_name_state.dart';
//
// class FirstNameCubit extends Cubit<FirstNameState> {
//   FirstNameCubit() : super(FirstNameState(isValid: true, isFocused: false));
//
//   void checkFirstName(String firstname)
//   {
//     var _isValid = Validator.validateFirstName(firstname);
//     print('FIRSTNAME CUBIT: $_isValid');
//     emit(FirstNameState(isValid: _isValid, isFocused: state.isFocused));
//   }
//
//   void setFocusOnFirstName(){
//     emit(FirstNameState(isValid: state.isValid, isFocused: true));
//   }
//
//   void setFocusOffFirstName(){
//     emit(FirstNameState(isValid: state.isValid, isFocused: false));
//   }
//
//
// }

import 'package:closestairport/global/constants/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'first_name_state.dart';

class FirstNameCubit extends Cubit<FirstNameState> {
  FirstNameCubit() : super(FirstNameState(isValid: true, isFocused: false));

  void checkFirstName(String firstname)
  {
    var _isValid = Validator.validateFirstName(firstname);
    print('FIRSTNAME CUBIT: $_isValid');
    emit(FirstNameState(isValid: _isValid, isFocused: state.isFocused));
  }

  void setFocusOnFirstName(){
    emit(FirstNameState(isValid: state.isValid, isFocused: true));
  }

  void setFocusOffFirstName(){
    emit(FirstNameState(isValid: state.isValid, isFocused: false));
  }
}