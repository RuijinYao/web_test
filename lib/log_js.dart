@JS('console')
library console;

import 'package:js/js.dart';

// 注解 `log` 函数去调用 js 的`console.log`
@JS()
external void log(dynamic str);


