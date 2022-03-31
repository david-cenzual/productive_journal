import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:productivejournal/domain/logger/interfaces/logger_interface.dart';
import 'package:productivejournal/get_it_impl.dart';

final logger = getIt<LoggerInterface>();

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.verbose(
      message: 'onChange(${bloc.runtimeType}, $change)',
    );
  }

  @override
  void onError(
    BlocBase bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    logger.information(
      message: 'onError(${bloc.runtimeType}',
      error: '$error',
      stack: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  FlutterError.onError = (details) {
    logger.error(
      error: details.exceptionAsString(),
      stack: details.stack,
    );
  };

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(await builder()),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => logger.error(
      error: error.toString(),
      stack: stackTrace,
    ),
  );
}
