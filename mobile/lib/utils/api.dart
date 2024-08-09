import 'dart:io' show Platform;
import 'package:http/http.dart';
import 'package:cronet_http/cronet_http.dart';
import 'package:cupertino_http/cupertino_http.dart';
import 'package:fetch_client/fetch_client.dart';
import 'package:http/io_client.dart';
import 'package:flutter/foundation.dart';

String get localhost {
  if (kReleaseMode) {
    return "https://appcuangan.hungqbui.xyz";
  }

  if (Platform.isAndroid) {
    return 'http://10.0.2.2:8000';
  } else if (Platform.isIOS) {
    return 'http://127.0.0.1:8000';
  }
  return 'http://localhost:8000';
}

Client get httpClient {
  if (Platform.isAndroid) {
    return CronetClient.defaultCronetEngine();
  }
  if (Platform.isIOS) {
    return CupertinoClient.defaultSessionConfiguration();
  }
  return FetchClient();
}
