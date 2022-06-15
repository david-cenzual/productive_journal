import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:productivejournal/infrastructure/infrastructure.dart';
import 'package:productivejournal/locator.dart';

final logs = locator<LoggerRepository>();

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logs.verbose(message: 'onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(
    BlocBase bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    logs.information(
      message: 'onError(${bloc.runtimeType}',
      error: '$error',
      stack: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> guardedRun(
  FutureOr<Widget> Function() builder,
) async {
  FlutterError.onError = (details) => logs.error(
        error: details.exceptionAsString(),
        stack: details.stack,
      );

  await runZonedGuarded(
    () async => BlocOverrides.runZoned(
      () async => runApp(await builder()),
      blocObserver: AppBlocObserver(),
    ),
    (error, stackTrace) => logs.error(
      error: error.toString(),
      stack: stackTrace,
    ),
  );
}
