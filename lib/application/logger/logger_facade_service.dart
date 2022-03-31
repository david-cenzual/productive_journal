import 'package:productivejournal/domain/logger/interfaces/logger_interface.dart';

class LoggerFacadeService {
  LoggerFacadeService(this._repository);

  final LoggerInterface _repository;

  void verbose({dynamic message, dynamic error, StackTrace? stack}) {
    _repository.information(message: message, error: error, stack: stack);
  }

  void debug({dynamic message, dynamic error, StackTrace? stack}) {
    _repository.information(message: message, error: error, stack: stack);
  }

  void information({dynamic message, dynamic error, StackTrace? stack}) {
    _repository.information(message: message, error: error, stack: stack);
  }

  void warn({dynamic message, dynamic error, StackTrace? stack}) {
    _repository.information(message: message, error: error, stack: stack);
  }

  void error({dynamic message, dynamic error, StackTrace? stack}) {
    _repository.information(message: message, error: error, stack: stack);
  }

  void fatal({dynamic message, dynamic error, StackTrace? stack}) {
    _repository.information(message: message, error: error, stack: stack);
  }
}
