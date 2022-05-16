import 'package:closestairport/global/di/dependency_injection.dart';
import 'package:closestairport/screens/about/about_presentation/about.dart';
import 'package:closestairport/screens/add_aircraft/add_craft_presentation/aircraft.dart';
import 'package:closestairport/screens/airport_detail/airport_detail_presentation/airport_detail_screen.dart';
import 'package:closestairport/screens/home/homepage_presentation/home_page.dart';
import 'package:closestairport/screens/login/login_logic/email_cubit.dart';
import 'package:closestairport/screens/login/login_logic/password_cubit.dart';
import 'package:closestairport/screens/login/login_presentation/login_screen.dart';
import 'package:closestairport/screens/profile/profile_presentation/profile_screen.dart';
import 'package:closestairport/screens/password/password_presentation/password_screen.dart';
import 'package:closestairport/screens/register/register_logic/contact_cubit.dart';
import 'package:closestairport/screens/register/register_logic/firstname_cubit.dart';
import 'package:closestairport/screens/register/register_logic/lastname_cubit.dart';
import 'package:closestairport/screens/register/register_presentation/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../screens/contact_us/contact_us_presentation/contactus_screen.dart';
import '../../../screens/password/password_logic/confirm_password_cubit.dart';
import '../../../screens/password/password_logic/current_password_cubit.dart';
import '../../../screens/password/password_logic/new_password_cubit.dart';
import '../../../screens/search/search_presentation/search_screen.dart';
import '../../../screens/splash/splash_presentation/splash_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case AppRoute.register:
        return MaterialPageRoute(
          builder: (_) =>  MultiBlocProvider(
            providers: [
              BlocProvider.value(value: getIt<FirstNameCubit>()),
              BlocProvider.value(value: getIt<LastNameCubit>()),
              BlocProvider.value(value: getIt<EmailCubit>()),
              BlocProvider.value(value: getIt<PasswordCubit>()),
              BlocProvider.value(value: getIt<ContactCubit>()),
            ],
            child: const RegisterScreen(),
          ),
        );
      case AppRoute.signIn:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: getIt<EmailCubit>()),
              BlocProvider.value(value: getIt<PasswordCubit>())
            ],
            child: const LoginScreen(),
          ),
        );
      case AppRoute.forgotPassword:
        return MaterialPageRoute(
          builder: (_) =>  MultiBlocProvider(
              providers: [
                BlocProvider.value(value: getIt<CurrentPasswordCubit>()),
                BlocProvider.value(value: getIt<NewPasswordCubit>()),
                BlocProvider.value(value: getIt<ConfirmPasswordCubit>()),
              ],
              child: const PasswordScreen()),
        );
      case AppRoute.contact:
        return MaterialPageRoute(
          // builder: (_) => const ForgotPasswordScreen(),
          builder: (_) =>  MultiBlocProvider(
              providers: [
                BlocProvider.value(value: getIt<CurrentPasswordCubit>()),
                BlocProvider.value(value: getIt<NewPasswordCubit>()),
                BlocProvider.value(value: getIt<ConfirmPasswordCubit>()),
              ],
              child: const ContactUs()),
        );
      case AppRoute.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case AppRoute.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case AppRoute.addCraft:
        return MaterialPageRoute(builder: (_) => const AirCraft(),
        );
      case AppRoute.about:
        return MaterialPageRoute(builder: (_) => const AboutScreen(),
        );
      case AppRoute.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen(),
        );
      case AppRoute.airportDetail:
        return MaterialPageRoute(builder: (_) => const AirportDetailScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}

class AppRoute {
  static const String register = '/register';
  static const String signIn = '/signIn';
  static const String forgotPassword = '/forgotPassword';
  static const String home = '/home';
  static const String contact = '/contact_us';

  static const String addCraft = '/addCraft';
  static const String profile = '/profile';
  static const String search ='/search';
  static const String airportDetail ='/airportDetail';
  static const String about = '/about';

}
