import 'package:mobile/utils/logging.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import './api.dart';

class SocketService {
  late IO.Socket _socket;

  // Singleton pattern to ensure only one instance of SocketService
  static final SocketService _instance = SocketService._internal();

  factory SocketService() {
    return _instance;
  }

  SocketService._internal() {
    _initializeSocket();
  }

  void _initializeSocket() {
    _socket = IO.io(localhost, <String, dynamic>{
      'transports': ['websocket'],
    });

    _socket.connect();

    _socket.onConnect((_) {
      logger.t('connected');
    });

    _socket.onDisconnect((_) {
      logger.t('disconnected');
    });

    // Additional event listeners can be added here
  }

  // Emit a message to the server
  void sendMessage(String event, dynamic data) {
    logger.t('Sending message: $event' + " " + data.toString());
    _socket.emit(event, data);
  }

  // Listen for events from the server
  void onMessage(String event, Function(dynamic) callback) {
    _socket.on(event, callback);
  }

  // Disconnect the socket
  void disconnect() {
    _socket.disconnect();
  }

  // Reconnect the socket
  void reconnect() {
    _socket.connect();
  }
}