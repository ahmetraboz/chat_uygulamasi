import 'package:chat_uygulamasi/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';



enum LoginFailure {
  invalidEmail,
  userNotFound,
  tooManyRequests,
  invalidCredential,
  userDisabled,
  unknownError,
}


enum RegisterFailures {
  emailAlreadyInUse,
  invalidEmail,
  operationNotAllowed,
  weakPassword,
  nullUser,
  unknownError,
}


class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<Either<UserModel, RegisterFailures>> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        return right(RegisterFailures.nullUser);
      }
      return left(
        UserModel(
            name: userCredential.user!.displayName ?? "null",
            email: userCredential.user!.email ?? "null"),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthException: ${e.code}");
      if (e.code == 'email-already-in-use') {
        return right(RegisterFailures.emailAlreadyInUse);
      } else if (e.code == 'invalid-email') {
          
        return right(RegisterFailures.invalidEmail);
      } else if (e.code == 'operation-not-allowed') {
        return right(RegisterFailures.operationNotAllowed);
      } else if (e.code == 'weak-password') {
        return right(RegisterFailures.weakPassword);
      } else {
        return right(RegisterFailures.unknownError);
      }
    } catch (e) {
      debugPrint("Bilinmeyen bir hata oluştu: $e");
      return right(RegisterFailures.unknownError);
    }
  }

  Future<Either < UserModel, LoginFailure  >> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        return right(LoginFailure.userNotFound);
      }
      return left(
        UserModel(
            name: userCredential.user!.displayName ?? "null",
            email: userCredential.user!.email ?? "null"),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthException: ${e.code}");
      if (e.code == 'invalid-email') {
        return right(LoginFailure.invalidEmail);
      } else if (e.code == 'user-not-found') {
        return right(LoginFailure.userNotFound);
      } else if (e.code == 'too-many-requests') {
        return right(LoginFailure.tooManyRequests);
      } else if (e.code == 'invalid-credential') {
        return right(LoginFailure.invalidCredential);
      } else if (e.code == 'user-disabled') {
        return right(LoginFailure.userDisabled);
      } else {
        return right(LoginFailure.unknownError);
      }
    } catch (e) {
      debugPrint("Bilinmeyen bir hata oluştu: $e");
      return right(LoginFailure.unknownError);
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      debugPrint('error: $e');
      return false;
    }
  }
}

