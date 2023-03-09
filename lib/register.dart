import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab08/auth_service.dart';
import 'package:lab08/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"), actions: [
        IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ));
            },
            icon: const Icon(Icons.logout))
      ]),
      body: SafeArea(
          child: Form(
        key: _formkey,
        child: ListView(children: [
          TextFormField(
            controller: _emailController,
            validator: ((value) {
              if (value!.isEmpty) {
                return "Enter Email Please !";
              }
              return null;
            }),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  print("Ok");
                  print(_emailController.text);
                  AuthService.registerUser(
                          _emailController.text, _passwordController.text)
                      .then((value) {
                    if (value == 1) {
                      Navigator.pop(context);
                    }
                  });
                }
              },
              child: const Text("Register"))
        ]),
      )),
    );
  }
}
