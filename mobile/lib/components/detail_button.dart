import 'package:flutter/material.dart';
import 'package:mobile/pages/main_event.dart';

class DetailButton extends StatelessWidget {
  final VoidCallback onPressed;

  DetailButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
         TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 100, 180, 245),
            ),
            onPressed: onPressed,
        
            child: const Text(
              'View Details >>',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 12,
                color: Colors.blue,
                decorationColor: Color.fromARGB(255, 100, 180, 245),
              ),
          ),
          ),
      ]);
  }

}