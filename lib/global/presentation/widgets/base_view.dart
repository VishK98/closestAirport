import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget child;

  const BaseView({Key? key,required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // final FocusScopeNode currentFocus = FocusScope.of(context);
        // if (!currentFocus.hasPrimaryFocus) {
        //   currentFocus.unfocus();
        // }
      },
      child: child,
    );
  }
}
