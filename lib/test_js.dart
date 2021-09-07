@JS()
library test;

import 'package:js/js.dart';

@JS('alert_js')
external void alertJs(dynamic name, dynamic message);

@JS()
external num scale(Scale scale);

@JS()
@anonymous
class Scale {
  external factory Scale({lengthScale, widthScale, heightScale});
  external num get lengthScale;
  external num get widthScale;
  external num get heightScale;
}


@JS('callback_test')
external Scale callbackTest(void Function(dynamic s) func, content);


@JS()
external void say();

@JS('say_hello')
external set sayHello(void Function() func);


/*@JS()
class Cuboid {
  external factory Cuboid(int length, int width, int height);
  external int get length;
  external int get width;
  external int get height;
  external num scale(Scale scale);
}*/


@JS()
class jQuery {
  external factory jQuery(String selector);
  external int get length;
  external jQuery css(CssOptions options);
  external jQuery animate(AnimateOptions options);
}

@JS()
@anonymous
class CssOptions {
  external factory CssOptions({backgroundColor, height, position, width});
  external dynamic get backgroundColor; // properties based on jQuery api
  external dynamic get height;
  external dynamic get position;
  external dynamic get width;
}

@JS()
@anonymous
class AnimateOptions {
  external factory AnimateOptions({left, top});
  external dynamic get left; // properties based on jQuery api
  external dynamic get top;
}