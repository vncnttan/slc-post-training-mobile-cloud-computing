import 'package:flutter/material.dart';
import 'package:frontend/pages/login_page.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/navigator.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/text_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void handleRegister() {}

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
                    "Register Page",
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
                    text: "Register",
                    onTap: handleRegister,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, const LoginPage(), false);
                    },
                    child: const Text(
                      "Login",
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
                    text: "Register with Google",
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
