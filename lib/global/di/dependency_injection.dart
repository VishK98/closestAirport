import 'package:closestairport/screens/login/login_logic/email_cubit.dart';
import 'package:closestairport/screens/login/login_logic/password_cubit.dart';
import 'package:closestairport/screens/password/password_logic/confirm_password_cubit.dart';
import 'package:closestairport/screens/password/password_logic/current_password_cubit.dart';
import 'package:closestairport/screens/password/password_logic/new_password_cubit.dart';
import 'package:closestairport/screens/register/register_logic/contact_cubit.dart';
import 'package:closestairport/screens/register/register_logic/firstname_cubit.dart';
import 'package:closestairport/screens/register/register_logic/lastname_cubit.dart';
import 'package:get_it/get_it.dart';



final getIt = GetIt.instance;

Future<void> initGetServiceLocator() async {
  ///LOGIN PAGE
  // const RegisterYourSelf();
  //Bloc

  //Cubit
  getIt.registerFactory(() => EmailCubit());
  getIt.registerFactory(() => PasswordCubit());
  getIt.registerFactory(() => FirstNameCubit());
  getIt.registerFactory(() => LastNameCubit());
  getIt.registerFactory(() => ContactCubit());
  getIt.registerFactory(() => CurrentPasswordCubit());
  getIt.registerFactory(() => NewPasswordCubit());
  getIt.registerFactory(() => ConfirmPasswordCubit());



}
