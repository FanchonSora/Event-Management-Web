import 'package:flutter/material.dart';
import 'package:mobile/components/square_tile.dart';
import 'package:mobile/components/my_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn(context) {
    // Implement sign-in functionality here
    Navigator.of(context).pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 30, 51),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 60),
                  const Text(
                    'App lam voi Ngan',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(0, 255, 255, 255),
                          Color.fromARGB(38, 255, 255, 255),
                          Color.fromARGB(54, 255, 255, 255),
                          Color.fromARGB(96, 255, 255, 255),
                          Color.fromARGB(128, 255, 255, 255)
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: usernameController,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 1.0,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            labelText: 'Username',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 165, 165, 0.773)),
                            floatingLabelStyle: TextStyle(
                                color: Color.fromARGB(255, 123, 199, 250),
                                fontSize: 16),
                            filled: true,
                            fillColor: Color.fromARGB(34, 9, 30, 51),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 123, 199, 250),
                                  width: 1.0,
                                )),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          controller: passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 165, 165, 0.773)),
                            filled: true,
                            fillColor: Color.fromARGB(41, 9, 30, 51),
                            floatingLabelStyle: TextStyle(
                                color: Color.fromARGB(255, 123, 199, 250),
                                fontSize: 16),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 1.0,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 12, 158, 255),
                                  width: 1.0,
                                )),
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
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.grey,
                                  decorationThickness: 1.0,
                                  fontStyle: FontStyle.italic,
                                  decorationStyle: TextDecorationStyle.solid,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        MyButton(onTap: () {
                          signUserIn(context);
                        }),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "Or continue with",
                                  style: TextStyle(color: Colors.grey[400]),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SquareTile(imagePath: 'lib/images/google.png'),
                            SizedBox(width: 10),
                            SquareTile(imagePath: 'lib/images/apple.png'),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Register now',
                        style: TextStyle(
                          color: Color.fromARGB(255, 81, 173, 248),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
