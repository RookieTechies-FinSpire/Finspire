import 'package:Finspire/model/userModel.dart';
import 'package:Finspire/screens/HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signUpWithEmailPasswd(String email, String passwd, String name) async {
    UserCredential? userCredential;

    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: passwd);
    } on FirebaseAuthException catch (e) {
      print(e.code.toString());
    }

    if (userCredential != null) {
      String uid = userCredential.user!.uid;
      UserModel? newUser = UserModel(email: email, name: name, uid: uid);

      await _firestore
          .collection("user")
          .doc(email)
          .set(newUser.toMap())
          .then((value) {
        print("User Created");
      });
    }
  }

  void logInWithEmailPasswd(
      String email, String passwd, BuildContext context) async {
    UserCredential? userCredential;

    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: passwd);
      Navigator.pushNamed(context, HomeScreen.id);
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Credentials"),
        ),
      );
    }

    if (userCredential != null) {}
  }

  signUserOut() {
    FirebaseAuth.instance.signOut();
  }
}
