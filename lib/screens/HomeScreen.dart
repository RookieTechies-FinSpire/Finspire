import 'package:Finspire/services/authService.dart';
import 'package:Finspire/widgets/chatBotWidget.dart';
import 'package:Finspire/widgets/dashboard.dart';
import 'package:Finspire/widgets/feedWidget.dart';
import 'package:Finspire/widgets/homeScreenWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedState = 0;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome, User",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              authService().signUserOut();
              if (FirebaseAuth.instance.currentUser == null) {
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff121139),
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              child: Text("Drawer"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              selectedState = index;
            });
          },
          indicatorColor: const Color(0xff121139),
          selectedIndex: selectedState,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.home,
                color: Color(0xff121139),
              ),
              label: "Home",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.graphic_eq,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.graphic_eq,
                color: Color(0xff121139),
              ),
              label: "Dashboard",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.feed,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.feed,
                color: Color(0xff121139),
              ),
              label: "Feed",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.message,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.message,
                color: Color(0xff121139),
              ),
              label: "ChatBot",
            ),
          ],
        ),
      ),
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
        child: selectedState == 0
            ? const homeScreenWidget()
            : selectedState == 1
                ? const dashboardWidget()
                : selectedState == 2
                    ? const feedWidget()
                    : const chatBotWidget(),
      ),
    );
  }
}
