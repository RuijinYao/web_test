import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class AppInfoWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'app_info',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = AppInfoWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'get_app_info':
        return "web";
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'app_info for web doesn\'t implement \'${call.method}\'',
        );
    }
  }
}
