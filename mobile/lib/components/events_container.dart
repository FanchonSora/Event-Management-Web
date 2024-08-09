import 'package:flutter/material.dart';
import 'package:mobile/components/detail_button.dart';
import 'package:mobile/pages/main_event.dart';
class Event extends StatelessWidget {
  final String title;
  final String? imageUrl; // Change to nullable
  final String description;
  final String date;
  final String time;
  final String location;
  
  Event({
    super.key,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.title,
    this.imageUrl, 
    });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Container for the gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(96, 255, 255, 255),
                  Color.fromARGB(128, 255, 255, 255),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 200,
                width: 400,
                child: imageUrl != null
                    ? Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: Text(
                                'Image not available',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                          );
                        },
                      )
                    : Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            'No Image Available',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 2, 60, 107)),
              ),
          DetailButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainEvent(
              eventName: title,
              description: description,
              date: date,
              time: time,
              location: location,
            )));
          })
        ],
      ),
    );
  }
}
