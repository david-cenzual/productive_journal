abstract class LoggerInterface {
  void verbose({dynamic message, dynamic error, StackTrace? stack});
  void debug({dynamic message, dynamic error, StackTrace? stack});
  void information({dynamic message, dynamic error, StackTrace? stack});
  void warn({dynamic message, dynamic error, StackTrace? stack});
  void error({dynamic message, dynamic error, StackTrace? stack});
  void fatal({dynamic message, dynamic error, StackTrace? stack});
}
