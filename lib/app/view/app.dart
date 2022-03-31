import 'package:beamer/beamer.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:flutter/material.dart';

import 'package:productivejournal/app/view/location_builder.dart';
import 'package:productivejournal/l10n/l10n.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final routerDelegate = BeamerDelegate(
    locationBuilder: simpleLocationBuilder,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 1980,
        minWidth: 480,
        defaultScale: true,
        breakpoints: const <ResponsiveBreakpoint>[
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ResponsiveBreakpoint.resize(2460, name: '4K'),
        ],
        background: Container(color: const Color(0xFFF5F5F5)),
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xfff8a73f),
          primaryVariant: Color(0xffcbb796),
          secondary: Color.fromARGB(255, 153, 149, 143),
          secondaryVariant: Color(0xff1b1612),
          appBarColor: Color(0xff1b1612),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 18,
        appBarOpacity: 0.7,
        tooltipsMatchBackground: true,
        lightIsWhite: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        surface: const Color.fromARGB(255, 216, 216, 220),
        // To use playground font, add GoogleFonts package and uncomment:
        // fontFamily: GoogleFonts.notoSans().fontFamily,
        subThemesData: const FlexSubThemesData(
          bottomNavigationBarOpacity: 0.95,
          bottomNavigationBarElevation: 9,
          inputDecoratorIsFilled: false,
          popupMenuOpacity: 0.95,
        ),
      ),
      darkTheme: FlexThemeData.dark(
        surface: const Color.fromARGB(0, 54, 54, 56),
        colors: const FlexSchemeColor(
          primary: Color(0xfff8a73f),
          primaryVariant: Color(0xffcbb796),
          secondary: Color(0xff99998f),
          secondaryVariant: Color(0xff1b1612),
          appBarColor: Color(0xff1b1612),
          error: Color(0xffb00020),
        ).defaultError.toDark(25),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 18,
        appBarStyle: FlexAppBarStyle.surface,
        appBarOpacity: 0.7,
        tooltipsMatchBackground: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use playground font, add GoogleFonts package and uncomment:
        // fontFamily: GoogleFonts.notoSans().fontFamily,
        subThemesData: const FlexSubThemesData(
          bottomNavigationBarOpacity: 0.95,
          bottomNavigationBarElevation: 9,
          inputDecoratorIsFilled: false,
          popupMenuOpacity: 0.95,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
