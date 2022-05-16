// import 'package:closestairport/global/constants/validators.dart';
// import 'package:closestairport/screens/add_aircraft/aircraft.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// part 'aircraftname.dart';
//
// class AirCraftNameCubit extends Cubit<AirCraftNameState> {
//   AirCraftNameCubit() : super(AirCraftNameState(isValid: true, isFocused: false));
//
//   void checkAirCraftName(String aircraftname)
//   {
//     var _isValid = Validator.validateAirCraftName(aircraftname);
//     print('AIRCRAFTNAME CUBIT: $_isValid');
//     emit(AirCraftNameState(isValid: _isValid, isFocused: state.isFocused));
//   }
//
//   void setFocusOnFirstName(){
//     emit(AirCraftNameState(isValid: state.isValid, isFocused: true));
//   }
//
//   void setFocusOffFirstName(){
//     emit(AirCraftNameState(isValid: state.isValid, isFocused: false));
//   }
// }