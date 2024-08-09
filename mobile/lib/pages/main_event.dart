import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/components/events_container.dart';
import 'package:mobile/components/detail_button.dart';

class MainEvent extends StatelessWidget {
  final String eventName;
  final String description;
  final String date;
  final String time;
  final String location;
  
  const MainEvent({
    super.key,
    required this.eventName,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
  });
  
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          eventName,
          style: TextStyle(
            color: Colors.white, 
            fontSize: 24, 
            fontWeight: FontWeight.bold, 
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 9, 30, 51),
      ),
      body: Column(
        children: [
          Text(
            description,
            style: const TextStyle(fontSize: 8),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            '$date at $time',
            style: const TextStyle(fontSize:8),
          ),
          const SizedBox(height: 10),
          Text(
            location,
            style: const TextStyle(fontSize: 8),
          ),
          const SizedBox(height: 10),

    ],
        
  ),
    );
}
}