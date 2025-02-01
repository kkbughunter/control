import 'package:firebase_auth/firebase_auth.dart';

class AuthManage {
  Future<UserCredential> register(String email, String password) async {
    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception("Registration failed: ${e.toString()}");
    }
  }

  Future<UserCredential> login(String email, String password) async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  User? get currentUser {
    return FirebaseAuth.instance.currentUser;
  }

  // Future<void> resetPassword(String email) async {
  //   try {
  // await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //   } on FirebaseAuthException catch (e) {
  //     String errorMessage = "Password reset failed. Please try again.";

  //     if (e.code == 'user-not-found') {
  //       errorMessage = "No user found with this email.";
  //     } else if (e.code == 'invalid-email') {
  //       errorMessage = "Invalid email format.";
  //     }

  //     throw Exception(errorMessage);
  //   } catch (e) {
  //     throw Exception("An unexpected error occurred: ${e.toString()}");
  //   }
  // }
}
