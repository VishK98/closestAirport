import 'package:closestairport/screens/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/app_icons.dart';
import '../../constants/size_config.dart';

class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return appbar(  );
  }

  AppBar appbar() {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.green),
      actions: [
        Row(
          children: [
            Image.asset(AppIcons.appbarIc),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 30,
            ),
              InkWell(
                onTap: (){
                  NavigationDrawer();
                },
                child: Container(
                  height: SizeConfig.blockSizeHorizontal! * 10,
                  width: SizeConfig.blockSizeHorizontal! * 10,
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(AppIcons.menu))),
                ),
              ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 4,
            ),
          ],
        )
      ],
    );
  }
}

AppBar customAppBar({required Function onTap}){
  return AppBar(
    shadowColor: Colors.transparent,
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.green),
    actions: [
      Row(
        children: [
          Image.asset(AppIcons.appbarIc),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 30,
          ),
          InkWell(
            onTap: ()=> onTap(),
            child: Container(
              height: SizeConfig.blockSizeHorizontal! * 10,
              width: SizeConfig.blockSizeHorizontal! * 10,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppIcons.menu))),
            ),
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 4,
          ),
        ],
      )
    ],
  );

}
