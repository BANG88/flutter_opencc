import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_opencc/flutter_opencc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _results = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String results;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      results = await FlutterOpencc.convert(
        """鼠标里面的硅二极管坏了，导致光标分辨率降低。
我们在老挝的服务器的硬盘需要使用互联网算法软件解决异步的问题。
为什么你在床里面睡着？""",
      );
    } on PlatformException {
      results = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _results = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('$_results\n'),
        ),
      ),
    );
  }
}
