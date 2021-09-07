#import "AppInfoPlugin.h"

@implementation AppInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"app_info"
            binaryMessenger:[registrar messenger]];
  AppInfoPlugin* instance = [[AppInfoPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"get_app_info" isEqualToString:call.method]) {
    result(@"iOS");
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
