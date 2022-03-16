import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/feature/user/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'user_view_model.g.dart';

class UserViewModel = _UserViewModelBase with _$UserViewModel;

abstract class _UserViewModelBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  UserModel? userModel;
  UserCredential? user;
  @action
  Future<User?> signIn() async {
    UserCredential? user;
    try {
      user = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    if (user != null) {
      return user.user!;
    }
  }

  @action
  Future<User?> signUp() async {
    user = await _auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    addUser();
    return user?.user;
  }

  Future<User?> addUser() async {
    userModel = UserModel(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text);
    await _firestore
        .collection("users")
        .doc(user?.user?.uid)
        .set(userModel!.toJson());
  }
}
