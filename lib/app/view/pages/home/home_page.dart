import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const name = 'Name';
    const surname = 'Surname';

    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, size) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: const <Widget>[
                  Text('Active Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('Old Sprint'),
                  Text('New Sprint'),
                  SizedBox(
                    height: kToolbarHeight,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.beamToNamed('/new-theme'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
