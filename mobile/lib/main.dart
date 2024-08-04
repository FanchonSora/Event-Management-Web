import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/my_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyLoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  //text editing controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 30, 48),
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment(-1, 0.4),
        //     colors: <Color>[
        //       Color.fromARGB(255, 27, 67, 50),
        //       Color.fromARGB(255, 45, 106, 79),
        //       Color.fromARGB(255, 64, 145, 108),
        //       Color.fromARGB(255, 82, 183, 136),
        //       Color.fromARGB(255, 116, 198, 157),
        //       Color.fromARGB(255, 149, 213, 178),
        //       Color.fromARGB(255, 183, 228, 199),
        //     ],
        //     tileMode: TileMode.mirror,
        //   ),
        // ),
        
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'App lam voi Ngan',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _usernameController,
                  style: TextStyle(color: Color.fromARGB(255,255,255,255)),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),  
                        width: 2.0,       
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Color.fromRGBO(165, 165, 165, 0.773)),
                    floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 123, 199, 250), fontSize: 16),
                    filled: true,
                    fillColor: Color.fromARGB(255, 0, 30, 48),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 123, 199, 250),   
                        width: 2.0,       
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color.fromRGBO(165, 165, 165, 0.773)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 0, 30, 48),
                    floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 123, 199, 250), fontSize: 16),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),  
                        width: 2.0,       
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 12, 158, 255),  
                        width: 2.0,       
                      )
                    ),
                  ),
                  obscureText: true,
                ),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white,fontSize: 12,decoration: TextDecoration.underline,
                    ),
                  ),
                  ],),
                  ),
                
                const SizedBox(height: 20),
                MyButton(
                  onTap: signUserIn,
                    // Implement login functionality here
                ),
                
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )
                    ),
                    
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or continue with",
                      style: TextStyle(color: Colors.grey[700]),),
                    ),
                  
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )
                    ),
                  ],),
                ),

              //login with Google, Apple
                Row(
                  children: [
                    Image.asset(
                      'lib/images/google.png',
                      height:30),
                
                
                    // const SizedBox(width: 10),
                    // Image.asset('lib/images/facebook.png'),
                    const SizedBox(width: 10),
                    Image.asset(
                      'lib/images/apple.png',
                      height:30),
                  ],
                ),

                  
                TextButton(
                  onPressed: () {
                    // Implement register functionality here
                  },
                  child: const Text('Don\'t have an account? Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
