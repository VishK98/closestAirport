import 'package:closestairport/global/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global/presentation/router/app_router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  initGetServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter router = AppRouter();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 925),
      builder: () => MaterialApp(
        builder: (context, child) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   primaryColor: AppColor.primary,
        //   cupertinoOverrideTheme: CupertinoThemeData(
        //       textTheme: CupertinoTextThemeData(
        //         dateTimePickerTextStyle: AppFont.regularBoldTextWithColor(AppColor.primaryTextColor),
        //         pickerTextStyle: AppFont.regularBoldTextWithColor(AppColor.primaryTextColor),
        //       )
        //   )
        // ),
        onGenerateRoute: router.onGenerateRoute,
      ),
    );
  }
}
