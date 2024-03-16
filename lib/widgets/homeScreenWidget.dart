import 'package:flutter/material.dart';

class homeScreenWidget extends StatelessWidget {
  const homeScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121139),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/HomeScreenBackground.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
