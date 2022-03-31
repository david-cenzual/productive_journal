import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = 'Name';
    var surname = 'Surname';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(
              key: const Key('Avatar'),
              backgroundColor: Colors.red,
              child: GestureDetector(
                child:
                    Text('${name.substring(0, 1)}${surname.substring(0, 1)}'),
                onTap: () => context.beamToNamed('/profile'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Text('Active Sprint'),
            Placeholder(),
            Text('Old Sprint'),
            Placeholder(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.beamToNamed('/new-theme'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
