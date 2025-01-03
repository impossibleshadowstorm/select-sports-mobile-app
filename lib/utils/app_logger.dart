import 'package:logger/logger.dart';
Logger get logger => AppLogger.instance;

class AppLogger extends Logger {
  AppLogger._() : super(printer: PrettyPrinter(printTime: true));
  static final instance = AppLogger._();
}