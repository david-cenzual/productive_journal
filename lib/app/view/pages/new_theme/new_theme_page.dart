import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:productivejournal/app/view/pages/new_theme/widgets/theme_form.dart';
import 'package:productivejournal/app/view/widgets/center_view.dart';

class NewThemePage extends HookWidget {
  const NewThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
        centerTitle: true,
      ),
      body: const CenteredView(
        widget: SingleChildScrollView(
          child: Form(
            key: Key('form_key'),
            child: ThemeForm(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Theme',
            icon: Icon(Icons.ac_unit),
          ),
          BottomNavigationBarItem(
            label: 'Ideas',
            icon: Icon(Icons.architecture),
          ),
        ],
      ),
    );
  }
}
