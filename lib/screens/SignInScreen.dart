import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static String id = "SignInScreen";
  const SignInScreen({super.key});

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
                "Welcome Back!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffEFEFEF),
                  fontSize: 41,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 64.0, right: 64.0, top: 24.0, bottom: 12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Username",
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
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xffA4A4A4),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    hintText: "Username",
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
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Color(0xffA4A4A4),
                    ),
                    suffixIcon: const Icon(
                      Icons.visibility,
                      color: Color(0xffA4A4A4),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    hintText: "Username",
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
                onPressed: () => print("Hello"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith((states) =>
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0))),
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xff812DE2),
                  ),
                ),
                child: const Text("Sign In"),
              ),
              const Row(children: <Widget>[
                Expanded(
                  child: Divider(
                    height: 100,
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
                  print("object");
                },
                icon: Image.asset(
                  "assets/images/google.png",
                  width: 24,
                  height: 24,
                ),
                label: const Text("Sign In with Google"),
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
                height: 85,
              )
            ],
          ),
        ),
      ),
    );
  }
}
