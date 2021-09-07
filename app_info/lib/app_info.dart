import 'dart:async';
import 'package:flutter/services.dart';

class AppInfo {
  static const MethodChannel _channel =
      const MethodChannel('app_info');

  static Future<String?> get appInfo async {
    final String? appInfo = await _channel.invokeMethod('get_app_info');
    return appInfo;
  }
}
