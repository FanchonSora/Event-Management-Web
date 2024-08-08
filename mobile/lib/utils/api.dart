import 'dart:io' show Platform;

String get localhost {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:PORT';
  } else if (Platform.isIOS) {
    return 'http://127.0.0.1:PORT';
  }
  return 'http://localhost:PORT';
}