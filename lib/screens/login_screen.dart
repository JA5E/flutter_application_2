import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [_loginForm()],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _usernameController,
          decoration: const InputDecoration(
              icon: Icon(Icons.mail), labelText: 'Aqui pon tu usuario'),
        ),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
              icon: Icon(Icons.lock_open), labelText: 'Aqui pon tu password'),
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
            onPressed: onLogin,
            child: const Text('Login'),
          ),
        )
      ],
    );
  }

  void onLogin() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    print('username: $username');
    print('password: $password');
  }
}
