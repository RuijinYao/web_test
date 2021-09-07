import 'package:app_info/app_info.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:js/js.dart';
import 'package:web_test/log_js.dart';
import 'package:web_test/publish_text.dart';
import 'package:web_test/test_js.dart';

void main() {
  /*jQuery('#output')
      .css(CssOptions(
      backgroundColor: 'green',
      height: 100,
      position: 'relative',
      width: 100))
      .animate(AnimateOptions(left: 100, top: 100));*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  late Box box;

  @override
  void initState() {
    super.initState();
    getAppInfo();

    jsTest();

    _hiveDatabase();
  }

  Future<void> getAppInfo() async {
    String? appInfo = await AppInfo.appInfo;
    print("getAppInfo: $appInfo");
  }

  void jsTest() {
    // 调用 JavaScript 中的 console.log() 方法
    log('Hello world!');

    // 进入页面时，弹框提醒
    alertJs("admin", "this is a message from dart");

    // 调用 JavaScript 中的 scale 方法
    var scaledVolume = scale(Scale(lengthScale: 1, widthScale: 0.5));
    print("scaledVolume: $scaledVolume");

    // 调用 JavaScript 中的 callback_test 方法，并且传递 Function 作为回调
    var result = callbackTest(allowInterop((content) async {
      await Future.delayed(Duration(seconds: 3));
      print("dart: $content");
    }), "this is a message from dart");

    print("result: ${result.widthScale}");

    sayHello = allowInterop(() {
      print("hello，my name is Eve");
    });

    say();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });

    await box.put("counter", _counter);
  }

  Future<void> _hiveDatabase() async {
    var tag = "hive";

    Hive
      ..init("Directory.current.path")
      ..registerAdapter(PublishTextAdapter());

    var boxIsExists = await Hive.boxExists("boxName");
    debugPrint("$tag boxExists: $boxIsExists");

    box = await Hive.openBox("boxName");

    box.put("key", "value");

    box.putAll({
      0: "value",
      "key2": "value",
      "key3": "value",
    });

    var value = box.get("key", defaultValue: "value");
    debugPrint("$tag get: $value");

    var indexValue = box.getAt(0);
    debugPrint("$tag getAt: $indexValue");

    // Saves the [value] with an auto-increment key.
    var autoIncrementKey = await box.add("value1");
    debugPrint("$tag add: $autoIncrementKey");

    var publishText1 = PublishText(textId: 1, key: "key1", publishId: 1);
    box.put("text-1", publishText1);
    var text1 = box.get("text-1") as PublishText;
    text1.key = "key2";
    debugPrint("$tag hiveObject: $text1");

    setState(() {
      debugPrint("containsKey: ${box.containsKey("counter")}");
      _counter = box.get("counter", defaultValue: -1);
    });
  }
}
