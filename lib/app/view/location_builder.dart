import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:productivejournal/app/app.dart';

final simpleLocationBuilder = RoutesLocationBuilder(
  routes: {
    '/': (context, state, data) => const BeamPage(
          key: ValueKey('splash'),
          title: 'Splash',
          child: SplashPage(),
        ),
    '/home': (context, state, data) => const BeamPage(
          key: ValueKey('home'),
          title: 'Home',
          child: HomePage(),
        ),
    '/sign_in': (context, state, data) => const BeamPage(
          key: ValueKey('login'),
          title: 'Login',
          child: SignInPage(),
        ),
    '/profile': (context, state, data) => const BeamPage(
          key: ValueKey('profile'),
          title: 'Profile',
          child: ProfilePage(),
        ),
    '/new-theme': (context, state, data) => const BeamPage(
          key: ValueKey('new_theme'),
          title: 'New Theme',
          child: NewThemePage(),
        ),
    '/whiteboard': (context, state, data) => const BeamPage(
          key: ValueKey('whiteboard'),
          title: 'Whiteboard',
          child: NewThemePage(),
        ),
  },
);
