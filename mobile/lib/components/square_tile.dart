import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget{
  final String imagePath;
  const SquareTile({super.key, required this.imagePath});

@override
Widget build(BuildContext context){
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromARGB(96, 250, 250, 250)),
      borderRadius: BorderRadius.circular(10),
      color: Color.fromARGB(0, 255, 255, 255),
    ),
    child: Image.asset(
      imagePath,
      height: 20,),
    );
  }
}