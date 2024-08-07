import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/utils/logging.dart';
import 'package:mobile/utils/get_geo_location.dart';
import 'package:geolocator/geolocator.dart';

class MyLandingPage extends StatefulWidget {
  const MyLandingPage({super.key});

  @override
  State<MyLandingPage> createState() => _MyLandingPageState();
}

class _MyLandingPageState extends State<MyLandingPage> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        LocatorUtil.determinePosition()
            .then((stream) => stream.asBroadcastStream().listen((position) {
                  logger.i(position);
                })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: const Center(
        child: Text('Landing Page'),
      ),
    );
  }
}
