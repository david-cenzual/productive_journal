import 'package:get_it/get_it.dart';

import 'package:productivejournal/infrastructure/infrastructure.dart';

final locator = GetIt.I;

Future<void> setupGetIt() async {
  locator.registerLazySingleton<LoggerRepository>(LoggerRepository.new);
}
