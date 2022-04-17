import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_boiler_plate/utils/constants.dart';
import 'package:flutter_boiler_plate/utils/utils.dart';
import 'package:flutter_boiler_plate/utils/wgt.dart';

enum Environment {
  development,
  production,
}

class App extends StatelessWidget {
  final Environment flavor;
  const App({
    Key? key,
    required this.flavor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          HWApp(
            flavor: flavor,
          ),
          if (flavor == Environment.development) IgnorePointer(child: Wgt.devWaterMark()),
        ],
      ),
    );
  }
}

class HWApp extends StatelessWidget {
  final Environment flavor;
  static RxBool isLoggedIn = false.obs;

  const HWApp({
    Key? key,
    required this.flavor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return GetMaterialApp(
      debugShowCheckedModeBanner: flavor == Environment.development,
      title: 'Holywings',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kColorPrimaryBg,
        backgroundColor: kColorPrimaryBg,
        scaffoldBackgroundColor: kColorSecondaryBg,
        colorScheme: const ColorScheme.dark(
          primary: kColorBrand,
          onPrimary: kColorTextBlack,
          onSurface: kColorTextWhite,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(
            headline1: kStyleHeadline1,
            headline2: kStyleHeadline2,
            headline3: kStyleHeadline3,
            bodyText1: kStyleBodyText1,
            bodyText2: kStyleBodyText2,
            subtitle1: kStyleSubtitle1,
            subtitle2: kStyleSubtitle2,
            button: button,
          ),
        ),
        cardTheme: const CardTheme(
          elevation: kElevationAppBar,
          shadowColor: Colors.black,
          color: kColorBg,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(kSizeRadius),
          ),
        ),
        appBarTheme: AppBarTheme(
          titleSpacing: kPaddingXS,
          toolbarHeight: kSizeToolbarHeight,
          titleTextStyle: kStyleHeadline2.copyWith(
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.resolveWith(
              (states) => const Size(kSizeMinButtonWidth, kSizeMinButtonHeight),
            ),
            textStyle: MaterialStateProperty.resolveWith(
              (states) => const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
            overlayColor: MaterialStateProperty.resolveWith((states) => kColorPrimary.withOpacity(0.2)),
          ),
        ),
      ),
      builder: (context, child) {
        if (child == null) return Container();
        return Obx(
          () {
            if (HWApp.isLoggedIn.isFalse) {
              return child;
            }

            return Scaffold(
              body: Row(
                children: [
                  Expanded(child: child),
                ],
              ),
            );
          },
        );
      },
      home: Utils.getInitialHome(),
    );
  }
}
