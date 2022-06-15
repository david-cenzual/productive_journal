import 'package:flutter/cupertino.dart';

import 'package:productivejournal/app/app.dart';
import 'package:productivejournal/guarded_run.dart';
import 'package:productivejournal/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  guardedRun(App.new);
}
