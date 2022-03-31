import 'package:get_it/get_it.dart';
import 'package:productivejournal/domain/logger/interfaces/logger_interface.dart';

import 'package:productivejournal/infrastructure/infrastructure.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt
    ..registerSingleton<LoggerInterface>(LoggerRepository())
    ..registerSingleton(() => null);
}
