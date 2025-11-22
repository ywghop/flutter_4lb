
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:lb4/services/auth_service.dart';



class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});



  @override

  State<LoginScreen> createState() => _LoginScreenState();

}



class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final AuthService _authService = AuthService();



  String _errorMessage = '';



  void _login() async {

    final email = _emailController.text;

    final password = _passwordController.text;



    if (email.isEmpty || password.isEmpty) {

      setState(() {

        _errorMessage = 'Please enter both email and password.';

      });

      return;

    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {

      setState(() {

        _errorMessage = 'Please enter a valid email address.';

      });

      return;

    }



    final response = await _authService.signInWithPassword(

      email,

      password,

    );



    if (!mounted) return;



    if (response != null) {

      setState(() {

        _errorMessage = response;

      });

    } else {

      Navigator.pushReplacementNamed(context, '/home');

    }

  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: CupertinoColors.systemGroupedBackground,

      body: Center(

        child: SingleChildScrollView(

          child: Padding(

            padding: const EdgeInsets.all(16.0),

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                const Text(

                  'Welcome Back',

                  style: TextStyle(

                    fontSize: 32,

                    fontWeight: FontWeight.bold,

                  ),

                ),

                const SizedBox(height: 8),

                const Text(

                  'Sign in to continue',

                  style: TextStyle(

                    fontSize: 16,

                    color: CupertinoColors.secondaryLabel,

                  ),

                ),

                const SizedBox(height: 40),

                CupertinoFormRow(

                  prefix: const Icon(CupertinoIcons.mail),

                  child: CupertinoTextField(

                    controller: _emailController,

                    placeholder: 'Email',

                    keyboardType: TextInputType.emailAddress,

                  ),

                ),

                const SizedBox(height: 16),

                CupertinoFormRow(

                  prefix: const Icon(CupertinoIcons.lock),

                  child: CupertinoTextField(

                    controller: _passwordController,

                    placeholder: 'Password',

                    obscureText: true,

                  ),

                ),

                const SizedBox(height: 24),

                if (_errorMessage.isNotEmpty)

                  Padding(

                    padding: const EdgeInsets.only(bottom: 16.0),

                    child: Text(

                      _errorMessage,

                      style: const TextStyle(color: CupertinoColors.destructiveRed),

                    ),

                  ),

                CupertinoButton.filled(

                  onPressed: _login,

                  child: const Text('Login'),

                ),

                const SizedBox(height: 16),

                CupertinoButton(

                  onPressed: () {

                    Navigator.pushNamed(context, '/register');

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




