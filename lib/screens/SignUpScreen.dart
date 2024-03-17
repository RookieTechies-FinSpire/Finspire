import 'package:Finspire/screens/HomeScreen.dart';
import 'package:Finspire/services/authService.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static String id = "SignUpScreen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwdController = TextEditingController();
TextEditingController usernameController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff15123F),
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/SignUpScreenBackground.png"),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text(
                "Get Started",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffEFEFEF),
                  fontSize: 41,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 64.0, right: 64.0, top: 0.0, bottom: 12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffA4A4A4),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 64.0, right: 64.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: usernameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xffA4A4A4),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    hintText: "Your Name",
                    hintStyle: const TextStyle(
                      color: Color(0xffA4A4A4),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  cursorColor: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 64.0, right: 64.0, top: 24.0, bottom: 12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffA4A4A4),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 64.0, right: 64.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xffA4A4A4),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    hintText: "Email Address",
                    hintStyle: const TextStyle(
                      color: Color(0xffA4A4A4),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  cursorColor: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 64.0, right: 64.0, top: 24.0, bottom: 12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffA4A4A4),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 64.0, right: 64.0),
                child: TextField(
                  controller: passwdController,
                  obscureText: isPasswordVisible,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Color(0xffA4A4A4),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      color: const Color(0xffA4A4A4),
                      onPressed: () {
                        setState(() {
                          if (isPasswordVisible) {
                            isPasswordVisible = false;
                          } else {
                            isPasswordVisible = true;
                          }
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    hintText: "Password",
                    hintStyle: const TextStyle(
                      color: Color(0xffA4A4A4),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  cursorColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  authService().signUpWithEmailPasswd(emailController.text,
                      passwdController.text, usernameController.text);
                  Navigator.pushNamed(context, HomeScreen.id);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith((states) =>
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0))),
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xff812DE2),
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Row(children: <Widget>[
                Expanded(
                  child: Divider(
                    height: 50,
                    indent: 100,
                    color: Color(0xffB6B6B6),
                  ),
                ),
                Text(
                  "Or Continue With",
                  style: TextStyle(
                    color: Color(0xffB6B6B6),
                  ),
                ),
                Expanded(
                  child: Divider(
                    endIndent: 100,
                    color: Color(0xffB6B6B6),
                  ),
                ),
              ]),
              ElevatedButton.icon(
                onPressed: () {
                  authService().signInWithGoogle();
                  Navigator.pushNamed(context, HomeScreen.id);
                },
                icon: Image.asset(
                  "assets/images/google.png",
                  width: 24,
                  height: 24,
                ),
                label: const Text(
                  "Sign Up with Google",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith((states) =>
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0))),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
