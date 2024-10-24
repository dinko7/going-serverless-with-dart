import 'dart:io';

class Env {
  static String get projectId => _env('PROJECT_ID');

  static String _env(String key) {
    final value = Platform.environment[key];
    if (value == null) {
      throw ArgumentError('Environment variable $key is not set');
    }
    return value;
  }
}
