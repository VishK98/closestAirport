import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/global/constants/size_config.dart';
import 'package:closestairport/global/presentation/router/app_router.dart';
import 'package:closestairport/screens/profile/profile_presentation/profile_screen.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal! * 65,
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(AppText.drawer,
                  style: AppFont.regularTextWithColor(color: AppColor.appWhite),),
              decoration: const BoxDecoration(
                color: AppColor.primary,
              ),
            ),
            SingleChildScrollView(
              child: ListTile(
                title: Text(AppText.register,
                    style: AppFont.regularTextWithColor(color: AppColor.primary)),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, AppRoute.register);
                },
              ),
            ),
            ListTile(
              title: Text(AppText.home,
                  style: AppFont.regularTextWithColor(color: AppColor.primary)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, AppRoute.home);
              },
            ),
            ListTile(
              title: Text(AppText.addaircraft,
                style: AppFont.regularTextWithColor(color: AppColor.primary)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, AppRoute.addCraft);
              },
            ),
            ListTile(
              title: Text(AppText.airportreq,
                  style: AppFont.regularTextWithColor(color: AppColor.primary)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, AppRoute.airportDetail);
              },
            ),
            ListTile(
              title: Text(AppText.generalaviation,
                  style: AppFont.regularTextWithColor(color: AppColor.primary)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, AppRoute.search);
              },
            ),
            ListTile(
              title: Text(AppText.profile,
                  style: AppFont.regularTextWithColor(color: AppColor.primary)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, AppRoute.profile);

              },
            ),
            ListTile(
              title: Text(AppText.contactus,
                  style: AppFont.regularTextWithColor(color: AppColor.primary)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, AppRoute.contact);
              },
            ),
            ListTile(
              title: Text(AppText.about,
                  style: AppFont.regularTextWithColor(color: AppColor.primary)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, AppRoute.about);
              },
            ),
            ListTile(
              title: Text(AppText.airportdetail,
                  style: AppFont.regularTextWithColor(color: AppColor.primary)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, AppRoute.airportDetail);
              },
            ),
          ],
        ),
      ),
    );
  }
}
