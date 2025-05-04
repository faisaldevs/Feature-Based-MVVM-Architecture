import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Number of stacktrace lines
      errorMethodCount: 5, // Stacktrace lines for error
      lineLength: 80, // Line wrap length
      colors: true, // Colorful logs
      printEmojis: true, // Emojis
      printTime: true, // Timestamps
    ),
  );

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.d(message, error: error, stackTrace: stackTrace);

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.i(message, error: error, stackTrace: stackTrace);

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.w(message, error: error, stackTrace: stackTrace);

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);

  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.v(message, error: error, stackTrace: stackTrace);
}