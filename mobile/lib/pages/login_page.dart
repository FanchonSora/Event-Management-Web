import 'package:flutter/material.dart';
import 'package:mobile/components/square_tile.dart';
import 'package:mobile/components/my_button.dart';
import 'package:mobile/components/my_text_field.dart';
import 'package:mobile/utils/logging.dart';
import 'dart:convert';
import 'package:mobile/utils/api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  bool isLogin = true;
  // sign user in method
  Future<void> signUserIn(BuildContext context) async {
    final response = await httpClient.post(Uri.parse('$localhost/v1/auth/login'),
        headers: {"Content-type": "application/json"},
        body: jsonEncode({
          'username': usernameController.text,
          'password': passwordController.text,
        }));
    logger.i(response.body);

    if (context.mounted) {
      Navigator.of(context).pushNamed('/home');
    }
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
                  const SizedBox(height: 40),
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
                        if (!isLogin)
                          MyTextField(
                            controller: emailController,
                            labelText: 'Email',
                            obscure: false,
                          ),
                        const SizedBox(height: 20),
                        MyTextField(
                          controller: usernameController,
                          labelText: 'Username',
                          obscure: false,
                        ),
                        const SizedBox(height: 20),
                        MyTextField(
                          controller: passwordController,
                          labelText: 'Password',
                          obscure: true,
                        ),
                        const SizedBox(height: 20),
                        if (!isLogin)
                          MyTextField(
                            controller: repeatPasswordController,
                            labelText: 'Repeat Password',
                            obscure: true,
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
                        MyButton(
                          onTap: () => {signUserIn(context)},
                        ),
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
                        isLogin
                            ? 'Don\'t have an account?'
                            : 'Already have an account? ',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.blue,
                          ),
                          onPressed: () => {
                                setState(() {
                                  isLogin = !isLogin;
                                })
                              },
                          child: Text(isLogin ? 'Sign up' : 'Sign in')),
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
