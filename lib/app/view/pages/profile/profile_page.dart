import 'dart:io' show Platform, exit;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const name = 'Name';
    const surname = 'Surname';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(
              key: const Key('Avatar'),
              backgroundColor: Colors.red,
              child: Text('${name.substring(0, 1)}${surname.substring(0, 1)}'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Text('User Information'),
            Placeholder(),
            Text('App Configuration'),
            Placeholder(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => {
          if (Platform.isAndroid)
            SystemChannels.platform.invokeMethod<dynamic>('SystemNavigator.pop')
          else if (Platform.isIOS)
            exit(0)
        },
        child: const Icon(
          Icons.exit_to_app_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}
