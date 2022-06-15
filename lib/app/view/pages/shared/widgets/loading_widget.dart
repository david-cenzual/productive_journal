import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoadingWidget extends HookWidget {
  const LoadingWidget({
    Key? key,
    this.androidColor,
    this.iosColor,
    this.backgroundColor,
    this.semanticsLabel,
    this.semanticsValue,
    this.valueColor,
    this.strokeWidth = 4.0,
    this.animating = true,
    this.radius = 10.0,
    this.value,
    this.orderColorList = const [],
  }) : super(key: key);

  final Color? androidColor;
  final Color? iosColor;
  final Color? backgroundColor;
  final bool animating;
  final double? value;
  final double strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;
  final double radius;
  final Animation<Color?>? valueColor;
  final List<Color?> orderColorList;

  @override
  Widget build(BuildContext context) {
    var lastIdx = 0;
    if (orderColorList.isNotEmpty) {
      lastIdx = orderColorList.indexOf(orderColorList.last);
    }

    final color = useState(
      kIsWeb
          ? orderColorList.isNotEmpty
              ? orderColorList[0]
              : androidColor
          : Platform.isIOS
              ? orderColorList.isNotEmpty
                  ? orderColorList[0]
                  : iosColor
              : orderColorList.isNotEmpty
                  ? orderColorList[0]
                  : androidColor,
    );

    void changeColor() {
      var currIdx = orderColorList.indexOf(color.value);

      if (currIdx != lastIdx) {
        color.value = orderColorList[currIdx + 1];
      } else {
        currIdx = 0;
        color.value = orderColorList[currIdx];
      }
    }

    if (orderColorList.isNotEmpty) {
      Timer.periodic(
        const Duration(milliseconds: 1500),
        (timer) {
          changeColor();
          timer.cancel();
        },
      );
    }

    return !kIsWeb
        ? Platform.isIOS
            ? CupertinoActivityIndicator(
                key: key,
                color: color.value,
                animating: animating,
                radius: radius,
              )
            : Container(
                margin: EdgeInsets.all(radius),
                child: CircularProgressIndicator(
                  key: key,
                  color: color.value,
                  backgroundColor: backgroundColor,
                  value: value,
                  valueColor: valueColor,
                  strokeWidth: strokeWidth,
                  semanticsLabel: semanticsLabel,
                  semanticsValue: semanticsValue,
                ),
              )
        : CupertinoActivityIndicator(
            key: key,
            color: color.value,
            animating: animating,
            radius: radius,
          );
  }
}
