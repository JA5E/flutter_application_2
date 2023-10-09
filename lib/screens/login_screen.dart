import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/login_form_provider.dart';
import 'package:flutter_application_2/screens/ui/input_decorations.dart';
import 'package:flutter_application_2/widgets/auth_background.dart';
import 'package:flutter_application_2/widgets/card_container.dart';
import 'package:provider/provider.dart';

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
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            CardContainer(
                child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text("Login", style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  height: 20,
                ),
                _loginForm(),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Sign in or create a new account",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            )),
          ],
        ),
      )),
    );
  }

  Widget _loginForm() {
    //flutter pub add provider
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: InputDecorations.authInputDecoration(
                hintText: "Ingresa un nombre propio solamente sin apellidos",
                labelText: 'Aqui pon tu usuario',
                prefixIcon: Icons.email),
            validator: (value) {},
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecorations.authInputDecoration(
                hintText: "Debe tener letras y numeros",
                prefixIcon: Icons.lock_open,
                labelText: 'Aqui pon tu password'),
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
      ),
    );
  }

  void onLogin() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    print('username: $username');
    print('password: $password');
  }
}
