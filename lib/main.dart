import 'package:flutter/cupertino.dart';

import 'package:productivejournal/app/app.dart';
import 'package:productivejournal/bootstrap.dart';
import 'package:productivejournal/get_it_impl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  bootstrap(App.new);
}
