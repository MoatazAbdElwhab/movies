import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/home/view/screens/home_screen.dart';
import 'package:movies/shared/app_theme.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const Movies()));
}

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(412, 870),
      child: MaterialApp(
        //  useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
        theme: AppTheme.theme,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
