import 'package:flutter/material.dart';
import 'package:mobile/components/events_container.dart';
import 'package:mobile/components/detail_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  bool isViewDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App gi day',
          style: TextStyle(
            color: Colors.white, 
            fontSize: 24, 
            fontWeight: FontWeight.bold, 
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 9, 30, 51),
      ),
      body: Container(
        color: const Color.fromARGB(255, 189, 189, 189), // Set the entire background to grey
        padding: const EdgeInsets.symmetric(vertical: 0.0,  horizontal :16.0,),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Event(
                  title: 'Event 1',
                  imageUrl: 'https://scontent-dfw5-2.xx.fbcdn.net/v/t1.15752-9/442719785_813291766971842_1372165911659268024_n.jpg?stp=dst-jpg_s2048x2048&_nc_cat=100&ccb=1-7&_nc_sid=9f807c&_nc_ohc=Lxdemtd_4cgQ7kNvgELMOnv&_nc_ht=scontent-dfw5-2.xx&oh=03_Q7cD1QHhSyqzF3rkgf2NcGd_ra_88ZpbdKtkxpaFOKZa2NlBaw&oe=66DD1CDB',
                  description: "hoa gay",
                  date: "12/12/2021",
                  time: "hoa ko gay",
                  location: "hoa lai gay",
                  
                ),

                // Event(
                //   title: 'Event 2',
                //   imageUrl: ''),

                // Event(
                //   title: 'Event 3',
                //   imageUrl: ''),

                // Event(
                //   title: 'Event 4',
                //   imageUrl: ''),
              ],
             
              
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp( MaterialApp(
    home: HomePage(),
  ));
}
