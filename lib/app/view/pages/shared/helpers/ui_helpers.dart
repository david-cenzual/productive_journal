import 'package:flutter/cupertino.dart';

class UIHelper {
  static const double _xsSpace = 5;
  static const double _smSpace = 10;
  static const double _bSpace = 15;
  static const double _mSpace = 20;
  static const double _lSpace = 25;
  static const double _xlSpace = 30;
  static const double _xl2largeSpace = 35;
  static const double _xl3largeSpace = 40;
  static const double _xl4largeSpace = 45;
  static const double _xl5largeSpace = 50;
  static const double _xl6largeSpace = 60;

  static Widget verticalSpace(double height) => SizedBox(height: height);
  static Widget horizontalSpace(double width) => SizedBox(width: width);

  static Widget xsColumn = verticalSpace(_xsSpace);
  static Widget smColumn = verticalSpace(_smSpace);
  static Widget bColumn = verticalSpace(_bSpace);
  static Widget mColumn = verticalSpace(_mSpace);
  static Widget lColumn = verticalSpace(_lSpace);
  static Widget xlColumn = verticalSpace(_xlSpace);
  static Widget xl2Column = verticalSpace(_xl2largeSpace);
  static Widget xl3Column = verticalSpace(_xl3largeSpace);
  static Widget xl4Column = verticalSpace(_xl4largeSpace);
  static Widget xl5Column = verticalSpace(_xl5largeSpace);
  static Widget xl6Column = verticalSpace(_xl6largeSpace);
  static Widget customColumnSpace(double height) => verticalSpace(height);

  static Widget get xsRow => horizontalSpace(_xsSpace);
  static Widget get smRow => horizontalSpace(_smSpace);
  static Widget get bRow => horizontalSpace(_bSpace);
  static Widget get mRow => horizontalSpace(_mSpace);
  static Widget get lRow => horizontalSpace(_lSpace);
  static Widget get xlRow => horizontalSpace(_xlSpace);
  static Widget get xl2Row => horizontalSpace(_xl2largeSpace);
  static Widget get xl3Row => horizontalSpace(_xl3largeSpace);
  static Widget get xl4Row => horizontalSpace(_xl4largeSpace);
  static Widget get xl5Row => horizontalSpace(_xl5largeSpace);
  static Widget get xl6Row => horizontalSpace(_xl6largeSpace);
  static Widget customRowSpace(double vertical) => horizontalSpace(vertical);
}
