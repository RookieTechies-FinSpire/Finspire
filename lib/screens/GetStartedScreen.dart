import 'package:fintect_bot/screens/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetStartedScreen extends StatelessWidget {
  static String id = "GetStartedScreen";
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff151240),
        systemNavigationBarColor: Color(0xff151240),
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151240),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/GetStartedBackground.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text(
                "Empowering Your Financial Future",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: Color(0xff9130F4),
                  fontSize: 39,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, SignInScreen.id),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith((states) =>
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0))),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xff812DE2),
                    ),
                  ),
                  child: const Text("Try Now"),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
