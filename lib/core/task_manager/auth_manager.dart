import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication extends ChangeNotifier {
  late final FirebaseAuth auth;
  UserCredential? user;
  User? userInfo;

  Authentication() {
    auth = FirebaseAuth.instance;
    userInfo = auth.currentUser;
  }

  Future<void> login(String email, String password) async {
    user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    userInfo = auth.currentUser;
  }

  Future<void> signUp(String email, String password) async {
    user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    userInfo = auth.currentUser;
  }

  Future<void> signOut() async {
    await auth.signOut();
    user = null;
  }
}
