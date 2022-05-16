import 'package:closestairport/global/constants/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactState(isValid: true, isFocused: false));

  void checkContact(String contact)
  {
    var _isValid = Validator.validateContact(contact);
    print('CONTACT CUBIT: $_isValid');
    emit(ContactState(isValid: _isValid, isFocused: state.isFocused));
  }

  void setFocusOnContact(){
    emit(ContactState(isValid: state.isValid, isFocused: true));
  }

  void setFocusOffContact(){
    emit(ContactState(isValid: state.isValid, isFocused: false));
  }
}