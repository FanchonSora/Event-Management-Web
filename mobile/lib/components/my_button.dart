import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyButton extends StatelessWidget {
  final String buttonText ;

  final Function()? onTap;
  
  const MyButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(13),
        margin:const EdgeInsets.symmetric(horizontal: 70),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 37, 115, 179),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
      ),
      )
      
    );

  }
}