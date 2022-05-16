import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/global/presentation/widgets/base_view.dart';
import 'package:closestairport/global/presentation/widgets/custom_appbar.dart';
import 'package:closestairport/screens/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';

class CommonScaffoldWidget extends StatelessWidget {
  final Widget child;
  final GlobalKey<ScaffoldState> globalScaffoldKey;
  final Color? backgroundColor;

  CommonScaffoldWidget({Key? key,
    required this.child,
    this.backgroundColor,
  }):globalScaffoldKey =  GlobalKey<ScaffoldState>(), super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseView(
        child: Scaffold(
          key: globalScaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColor ?? AppColor.appWhite,
          appBar: customAppBar(onTap: () {
            globalScaffoldKey.currentState?.openEndDrawer();
          }),
          endDrawerEnableOpenDragGesture: true,
          endDrawer: const NavigationDrawer(),
          body: child,
        ),
      ),
    );
  }
}
