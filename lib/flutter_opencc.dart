import 'dart:async';

import 'package:flutter/services.dart';

enum OpenccConfig { s2t, t2s, s2tw, tw2s, s2hk, hk2s, s2twp, tw2sp, t2hk, t2tw }

class FlutterOpencc {
  static const MethodChannel _channel = const MethodChannel('flutter_opencc');

  /// * Conversion between Traditional and Simplified Chinese
  /// * config: defaults to s2t
  static Future<String> convert(String text,
      {OpenccConfig config = OpenccConfig.s2t}) async {
    assert(text.isNotEmpty);
    assert(config != null);
    final String version = await _channel.invokeMethod(
      'convert',
      {
        "text": text,
        "config": config.toString().split('.')[1],
      },
    );
    return version;
  }
}
