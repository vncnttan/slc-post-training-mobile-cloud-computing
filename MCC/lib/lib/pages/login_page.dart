import 'package:flutter/material.dart';
import 'package:frontend/pages/register_page.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/navigator.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    "Login Page",
                    style: TextStyle(fontSize: 25, color: fontColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInput(
                    hintText: "Email",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextInput(
                    hintText: "Password",
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  CustomButton(
                    text: "Login",
                    onTap: _handleLogin,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "Dont have an account?",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, const RegisterPage(), false);
                    },
                    child: const Text(
                      "Create account",
                      style: TextStyle(fontSize: 14, color: fontColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(
                    color: secondaryColor,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomButton(
                    text: "Sign in with Google",
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
