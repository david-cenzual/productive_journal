import 'package:logger/logger.dart';
import 'package:productivejournal/domain/logger/interfaces/logger_interface.dart';

class LoggerRepository implements LoggerInterface {
  final logger = Logger(
    printer: PrettyPrinter(
      noBoxingByDefault: true,
      printTime: true,
      printEmojis: false,
    ),
  );

  @override
  void verbose({dynamic message, dynamic error, StackTrace? stack}) {
    logger.v(
      message == null ? message : 'VerboseLog: $message',
      error == null ? error : 'VerboseLog: $error',
      stack ?? StackTrace.empty,
    );
  }

  @override
  void debug({dynamic message, dynamic error, StackTrace? stack}) {
    logger.d(
      message == null ? message : 'DebugLog: $message',
      error == null ? error : 'DebugLog: $error',
      stack ?? StackTrace.empty,
    );
  }

  @override
  void information({dynamic message, dynamic error, StackTrace? stack}) {
    logger.i(
      message == null ? message : 'InformationLog: $message',
      error == null ? error : 'InformationLog: $error',
      stack ?? StackTrace.empty,
    );
  }

  @override
  void warn({dynamic message, dynamic error, StackTrace? stack}) {
    logger.w(
      message == null ? message : 'WarningLog: $message',
      error == null ? error : 'WarningLog: $error',
      stack ?? StackTrace.empty,
    );
  }

  @override
  void error({dynamic message, dynamic error, StackTrace? stack}) {
    logger.e(
      message == null ? message : 'ErrorLog: $message',
      error == null ? error : 'ErrorLog: $error',
      stack ?? StackTrace.empty,
    );
  }

  @override
  void fatal({dynamic message, dynamic error, StackTrace? stack}) {
    logger.wtf(
      message == null ? message : 'FatalLog: $message',
      error == null ? error : 'FatalLog: $error',
      stack ?? StackTrace.empty,
    );
  }
}
