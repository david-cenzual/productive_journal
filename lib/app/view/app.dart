import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:productivejournal/app/view/location_builder.dart';
import 'package:productivejournal/app/view/pages/shared/widgets/loading_widget.dart';
import 'package:productivejournal/bloc/auth_bloc/auth_bloc.dart';
import 'package:productivejournal/l10n/l10n.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final beamerDelegate = BeamerDelegate(
    locationBuilder: simpleLocationBuilder,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: LoadingWidget());
        }
        return BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
          child: MaterialApp.router(
            builder: (context, widget) => ResponsiveWrapper.builder(
              widget,
              maxWidth: 1980,
              minWidth: 320,
              defaultScale: true,
              breakpoints: const <ResponsiveBreakpoint>[
                ResponsiveBreakpoint.resize(320, name: MOBILE),
                ResponsiveBreakpoint.resize(800, name: TABLET),
                ResponsiveBreakpoint.resize(1980, name: DESKTOP),
                ResponsiveBreakpoint.resize(2460, name: '4K'),
              ],
              background: Container(color: const Color(0xFFF5F5F5)),
            ),
            routerDelegate: beamerDelegate,
            routeInformationParser: BeamerParser(),
            backButtonDispatcher: BeamerBackButtonDispatcher(
              delegate: beamerDelegate,
            ),
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: FlexThemeData.light(
              colors: const FlexSchemeColor(
                primary: Color(0xff9e9e9e),
                primaryVariant: Color(0xffe0e0e0),
                secondary: Color(0xff0d0d0d),
                secondaryVariant: Color(0xff5c5c5c),
                appBarColor: Color(0xff5c5c5c),
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
                primary: Color(0xfffafafa),
                primaryVariant: Color(0xff9e9e9e),
                secondary: Color(0xff424242),
                secondaryVariant: Color(0xff212121),
                appBarColor: Color(0xff212121),
                error: Color(0xffcf6679),
              ),
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
          ),
        );
      },
    );
  }
}
