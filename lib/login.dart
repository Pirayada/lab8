// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lab08/auth_service.dart';
import 'package:lab08/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordComtroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("632021129")),
      body: SafeArea(
          child: Form(
        key: _formkey,
        child: ListView(children: [
          TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
              validator: ((value) {
                if (value!.isEmpty) {
                  return " Enter Email Please! ";
                }
                return null;
              })),
          TextFormField(
            controller: _passwordComtroller,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
            validator: ((value) {
              if (value!.isEmpty) {
                return "Enter Password Please";
              }
              return null;
            }),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  AuthService.loginUser(
                          _emailController.text, _passwordComtroller.text)
                      .then((value) => {
                            if (value == 1)
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Register(),
                                    ))
                              }
                          });
                }
              },
              child: const Text("Login")),
          ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  AuthService.registerUser(
                          _emailController.text, _passwordComtroller.text)
                      .then((value) => {
                            if (value == 1)
                              {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ))
                              }
                          });
                }
              },
              child: const Text("Register")),
        ]),
      )),
    );
  }
}
