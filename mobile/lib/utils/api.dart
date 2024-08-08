import 'dart:io' show Platform;

String get localhost {
  if (Platform.isAndroid) {
    return 'http://172.18.0.1:8000';
  } else if (Platform.isIOS) {
    return 'http://127.0.0.1:8000';
  }
  return 'http://localhost:8000';
}
