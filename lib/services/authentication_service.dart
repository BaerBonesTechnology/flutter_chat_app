import 'package:chat_app/app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/user/user.dart';

class AuthenticationService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  /// Retrives current user
  Future<AppUser?> retrieveUser() async {
    AppUser? user;
    try {
      if (_firebaseAuth.currentUser != null) {
        User firebaseUser = _firebaseAuth.currentUser!;
        await _firebaseFirestore.collection('users').doc(firebaseUser.uid)
            .get()
            .then((snapshot) {
          if (snapshot.exists) {
            user = AppUser.fromJson(snapshot.data()!);
          }
          else {
            throw NoUserFoundException();
          }
        }
        );
      }
    }catch (e){
      if(kDebugMode){
        print(e);
      }
    }
    return user;
  }

  /// Sign up user to application
  Future<AppUser?> signUp(String email, String password) async {
    AppUser? user;
    try {
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      _firebaseFirestore.collection('users').doc(cred.user!.uid).get().then((snapshot){
        if(snapshot.exists) {
          user = AppUser.fromJson(snapshot.data()!);
        }
      });
    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
    return user;
  }

  /// Sign in user to application
  Future<AppUser?> signIn(String email, String password) async {
    AppUser? user;
    try {
      UserCredential cred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (cred.user != null) {
       await _firebaseFirestore.collection('users').doc(cred.user!.uid).get().then((snapshot){
         if(snapshot.exists){
           user = AppUser.fromJson(snapshot.data()!);
         }
       });
      }
    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
    return user;
  }

  /// Sign out user
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  /// Verify by Email
  Future<void> verifyEmail() async {
    User? user = _firebaseAuth.currentUser;
    if(user != null && !user.emailVerified){
      await user.sendEmailVerification();
    }
  }
}

class NoUserFoundException implements Exception {
  @override
  String message = "No User Found";
}