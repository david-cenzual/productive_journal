import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CenteredView extends HookWidget {
  const CenteredView({this.widget, Key? key}) : super(key: key);

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).colorScheme.surface;

    return ResponsiveBuilder(
      builder: (context, size) {
        return Container(
          height: double.infinity,
          color: background,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: background,
              ),
              child: widget,
            ),
          ),
        );
      },
    );
  }
}
