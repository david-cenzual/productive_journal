import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:productivejournal/app/view/pages/home/home_page.dart';
import 'package:productivejournal/app/view/pages/new_theme/new_theme_page.dart';
import 'package:productivejournal/app/view/pages/profile/profile_page.dart';

// OPTION A:
final simpleLocationBuilder = RoutesLocationBuilder(
  routes: {
    '/': (context, state, data) => const BeamPage(
          key: ValueKey('home'),
          title: 'Home',
          child: HomePage(),
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
    // '/books': (context, state, data) => BeamPage(
    //       key: ValueKey('books'),
    //       title: 'Books',
    //       child: BooksScreen(),
    //     ),
    // '/books/:bookId': (context, state, data) {
    //   final book = books.firstWhere((book) =>
    //       book['id'] ==
    //       (context.currentBeamLocation.state as BeamState)
    //           .pathParameters['bookId']);
    //   return BeamPage(
    //     key: ValueKey('book-${book['id']}'),
    //     title: book['title'],
    //     child: BookDetailsScreen(book: book),
    //   );
    // }
  },
);
