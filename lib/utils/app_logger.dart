import 'package:logger/logger.dart';

Logger get logger => AppLogger.instance;

class AppLogger extends Logger {
  AppLogger._()
      : super(
          printer: PrettyPrinter(
            colors: true,
            printEmojis: true,
            dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
          ),
        );
  static final instance = AppLogger._();
}
