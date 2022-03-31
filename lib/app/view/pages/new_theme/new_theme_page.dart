import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:productivejournal/app/view/pages/new_theme/widgets/theme_form.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NewThemePage extends HookWidget {
  const NewThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
        centerTitle: true,
      ),
      body: ResponsiveBuilder(
        builder: (context, size) {
          return SingleChildScrollView(
            child: Form(
              key: const Key('form_key'),
              child: Padding(
                padding: EdgeInsets.all(size.screenSize.width * .03),
                child: const ThemeForm(),
              ),
            ),
          );
        },
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
