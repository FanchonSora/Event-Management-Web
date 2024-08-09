import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile/utils/logging.dart';
import 'package:mobile/utils/get_geo_location.dart';
import 'package:mobile/utils/websocket_channel.dart';

class MyLandingPage extends StatefulWidget {
  const MyLandingPage({super.key});

  @override
  State<MyLandingPage> createState() {
    return _MyLandingPageState();
  }
}

class _MyLandingPageState extends State<MyLandingPage> {
  int _counter = 0;
  String posString = "Position";
  final SocketService _socketService = SocketService();

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        LocatorUtil.determinePosition()
            .then((stream) => stream.asBroadcastStream().listen((position) {
                  logger.i(position);
                  setState(() {
                    posString = position.toString();

                  });
                  _socketService.sendMessage('positionUpdate', {
                    "data": position.toString(),
                  });
                })));
  }

  void sendData() {
    _socketService.sendMessage('greet', {
      "data": "Hello from Flutter",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: Column(
        children: [
          Center(
            child: FloatingActionButton(
              child: Text('$_counter'),
              onPressed: () {
                sendData();
                setState(() {
                  _counter++;
                });
              },
            ),
          ),
          Text("$_counter"),
          Text(posString)
        ],
      ),
    );
  }
}
